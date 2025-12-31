{ config, pkgs, lib, vars, ... }:
let
  colors = config.lib.stylix.colors;

  themeDir = ../themes + "/${vars.theme}";
  themeHyprlock = if builtins.pathExists (themeDir + "/hyprlock.nix")
                  then import (themeDir + "/hyprlock.nix") { inherit colors; }
                  else {};

  fontFamily = themeHyprlock.fontFamily or "SF Pro Rounded";
  fontSize = themeHyprlock.fontSize or 64;
  inputSize = themeHyprlock.inputField.size or "300, 50";
  inputOutline = themeHyprlock.inputField.outlineThickness or 2;
  inputDotsSize = themeHyprlock.inputField.dotsSize or 0.33;
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading = true;
        hide_cursor = true;
      };

      background = lib.mkForce [
        {
          monitor = "";
          path = "screenshot";
          color = "rgba(${colors.base00}ff)";
          blur_passes = 1;
        }
      ];

      input-field = lib.mkForce [
        {
          monitor = "";
          size = inputSize;
          outline_thickness = inputOutline;
          dots_size = inputDotsSize;
          dots_spacing = 0.15;
          dots_center = true;
          outer_color = "rgba(${colors.base0D}ff)";
          inner_color = "rgba(${colors.base00}ff)";
          font_color = "rgba(${colors.base05}ff)";
          fade_on_empty = false;
          placeholder_text = "<i>Password...</i>";
          hide_input = false;
          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];

      label = lib.mkForce [
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(${colors.base05}ff)";
          font_size = fontSize;
          font_family = fontFamily;
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
