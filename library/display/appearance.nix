let
  theme = import ./themes/current.nix;
in {
  general = {
    gaps_in = theme.hyprland.gaps_in;
    gaps_out = theme.hyprland.gaps_out;
    border_size = theme.hyprland.border_size;
    "col.inactive_border" = "rgba(${theme.colors.inactive_border}ee)";
    "col.active_border" = "rgba(${theme.colors.active_border}ee)";

    layout = "master";
  };

  decoration = {
    rounding = theme.hyprland.rounding;

    shadow = {
      enabled = true;
      range = 40;
      render_power = 4;
      color = "0x66000000";
      offset = "0 4";
      scale = 1.0;
    };

    blur = {
      enabled = true;
      size = 6;
      passes = 2;
      ignore_opacity = true;
    };
  };

  dwindle = {
    # single_window_aspect_ratio = "1 1"; # Uncomment if needed
  };

  animations = {
    enabled = true;

    bezier = [
      "f, 0.05, 0.9, 0.1, 1"
    ];

    animation = [
      "workspaces, 1, 4, f, slide"
      "windowsMove, 1, 4, f, slide"
    ];
  };

  plugin = {
    hyprbars = {
      bar_height = 24;
      bar_part_of_window = true;
      bar_title_enabled = true;
      bar_precedence_over_border = true;
      bar_buttons_alignment = "left";
      bar_color = "rgba(${theme.colors.bg},1)";
      bar_blur = true;
      bar_padding = 12;
      bar_button_padding = 9;

      "hyprbars-button" = [
        "rgb(${theme.colors.red}), 13, , hyprctl dispatch killactive"
        "rgb(${theme.colors.yellow}), 13, , hyprctl dispatch fullscreen 1"
      ];
    };

    overview = {
      gapsIn = 4;
      gapsOut = 20;
      panelHeight = 160;
    };
  };
}