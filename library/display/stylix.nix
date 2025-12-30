{ lib, pkgs, vars, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    image = ./wallpapers/gruvbox_scenery.png;

    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = lib.mkDefault vars.fontMono;
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
  };

  home-manager.users.${vars.username}.stylix.targets.zen-browser.profileNames = [ "default" ];
}
