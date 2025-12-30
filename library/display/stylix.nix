# https://stylix.danth.me/
{ lib, pkgs, vars, ... }:
let
  themeData = import (./themes + "/${vars.theme}.nix") { inherit pkgs; };
in {
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = themeData.scheme;
    image = themeData.wallpaper;
    polarity = themeData.polarity;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = lib.mkForce vars.fontMono;
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      sizes = {
        terminal = lib.mkDefault vars.fontSize;
        applications = 11;
      };
    };

    cursor = {
      package = pkgs.apple-cursor;
      name = lib.mkDefault vars.cursorTheme;
      size = lib.mkDefault vars.cursorSize;
    };

    targets.grub.enable = false;
  };

  home-manager.users.${vars.username}.stylix.targets = {
    vscode.enable = lib.mkDefault false;
    hyprpaper.enable = lib.mkDefault false;
    zen-browser.profileNames = [ "default" ];
  };
}
