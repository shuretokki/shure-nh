# https://github.com/vicinaehq/vicinae
{ config, lib, pkgs, vars, inputs, ... }:
let
  settingsJsonContent = builtins.toJSON {
    close_on_focus_loss = true;
    consider_preedit = true;
    pop_to_root_on_close = true;
    favicon_service = "twenty";
    search_files_in_root = true;
    font = {
      normal = {
        size = 10.5;
        normal = vars.fontSans;
      };
    };
    theme = {
      light = {
        name = "gruvbox-light";
        icon_theme = "default";
      };
      dark = {
        name = "gruvbox-dark";
        icon_theme = "default";
      };
    };
    launcher_window = {
      opacity = 0.88;
    };
    extensions = {};
  };

  settingsFile = pkgs.writeText "vicinae-settings.json" settingsJsonContent;
in {
  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };
  };

  xdg.configFile."vicinae/settings.json".enable = lib.mkForce false;

  home.packages = with pkgs; [ sqlite ];

  home.activation.vicinaeSetup = lib.hm.dag.entryAfter ["writeBoundary"] ''
    VICINAE_CONFIG_DIR="$HOME/.config/vicinae"
    VICINAE_SETTINGS="$VICINAE_CONFIG_DIR/settings.json"
    VICINAE_DB="$HOME/.local/share/vicinae/vicinae.db"

    mkdir -p "$VICINAE_CONFIG_DIR"
    if [ -L "$VICINAE_SETTINGS" ]; then
      rm "$VICINAE_SETTINGS"
    fi
    if [ ! -f "$VICINAE_SETTINGS" ]; then
      cp "${settingsFile}" "$VICINAE_SETTINGS"
      chmod 644 "$VICINAE_SETTINGS"
      echo "Created writable Vicinae settings.json"
    fi

    if [ -f "$VICINAE_DB" ]; then
      ${pkgs.sqlite}/bin/sqlite3 "$VICINAE_DB" << 'EOF'
        INSERT OR REPLACE INTO storage_data_item (namespace_id, value_type, key, value)
        VALUES
          ('@sovereign/store.vicinae.awww-switcher:data', 1, 'wallpaperPath', '${config.home.homeDirectory}/${vars.wallpaperDir}'),
          ('@sovereign/store.vicinae.awww-switcher:data', 1, 'gridRows', '4'),
          ('@sovereign/store.vicinae.awww-switcher:data', 1, 'transitionType', 'random'),
          ('@sovereign/store.vicinae.awww-switcher:data', 1, 'transitionDuration', '1');
EOF
      echo "Injected Vicinae extension preferences into database"
    fi
  '';
}
