{ config, pkgs, inputs, ... }: {
    imports = [
        ./wallpaper.nix
        inputs.zen-browser.homeModules.beta
        # or inputs.zen-browser.homeModules.twilight
        # or inputs.zen-browser.homeModules.twilight-official
    ];

    home.username = "shure";
    home.homeDirectory = "/home/shure";
    home.stateVersion = "25.11";

   #  home.packages = with pkgs; [
   #  ] ++ (with inputs.vicinae-extensions.packages.${pkgs.system}; [
   #      bluetooth
   #      nix
   #      power-profile
   #  ]);

    programs.bash = {
        enable = true;
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flakes ~/shure-nh";
            eza = "eza --icons";
        };
        profileExtra = ''
            if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
                exec uwsm start hyprland-uwsm.desktop
            fi
        '';
    };

    services.vicinae = {
        enable = true;

        systemd = {
            enable = true;
            environment = {
                USE_LAYER_SHELL = 1;
            };
        };

        settings = {
            close_on_focus_loss = true;
            consider_preedit = true;
            pop_to_root_on_close = true;
            favicon_service = "twenty";
            search_files_in_root = true;

            font = {
                normal = {
                size = 11;
                normal = "SF Pro Rounded";
                };
            };

            theme = {
                light = {
                name = "vicinae-light";
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
        };
    };

    programs.git = {
        enable = true;
        extraConfig = {
            user.name = "Tri R. Utomo";
            user.email = "tri.r.utomo@gmail.com";
        };
    };

    programs.vscode = {
        enable = true;
        mutableExtensionsDir = true;
    };

    programs.zen-browser.enable = true;
}