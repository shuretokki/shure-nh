# Gruvbox Dark Theme
# Source: https://github.com/morhetz/gruvbox
{ pkgs }: {
  scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  wallpaper = ../wallpapers/gruvbox_scenery.png;
  polarity = "dark";

  appearance = {
    rounding = 10;
    blur = true;
    shadows = true;
    border_size = 2;
  };
}
