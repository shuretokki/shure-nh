# https://stylix.danth.me/
{ lib, pkgs, vars, config, ... }:
let
in {
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = config.theme.scheme;
    image = config.theme.wallpaper;
    polarity = config.theme.polarity;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = lib.mkForce config.theme.fonts.mono;
      };
      sansSerif = {
        package = pkgs.inter;
        name = config.theme.fonts.sans;
      };
      sizes = {
        terminal = lib.mkDefault config.theme.fonts.size;
        applications = 11;
      };
    };

    cursor = {
      package = pkgs.apple-cursor;
      name = lib.mkDefault config.theme.cursor.name;
      size = lib.mkDefault config.theme.cursor.size;
    };

    targets.grub.enable = false;
  };

  imports = [
    ./themes/default.nix
    (./themes + "/${vars.theme}/default.nix")
  ];

  home-manager.users.${vars.username} = { config, lib, ... }: {
    stylix.targets = {
      vscode.enable = lib.mkDefault false;
      hyprpaper.enable = lib.mkDefault false;
      spicetify.enable = false;
      zen-browser.profileNames = [ "default" ];
    };

    # auto-update wallpaper symlink on rebuild
    home.activation.linkWallpapers = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "${config.home.homeDirectory}/Wallpapers"
      if [ -d "${./themes + "/${vars.theme}/wallpapers"}" ]; then
         ln -sfn "${./themes + "/${vars.theme}/wallpapers"}" "${config.home.homeDirectory}/Wallpapers/current"
      fi
    '';
  };
}
