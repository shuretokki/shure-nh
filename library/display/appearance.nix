{
  general = {
    gaps_in = 4;
    gaps_out = 4;
    border_size = 1;
    "col.inactive_border" = "rgba(515151ee)";
    "col.active_border" = "rgba(00ff99ee)";

    layout = "master";
  };

  decoration = {
    rounding = 0;

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
      bar_color = "rgba(40,40,40,1)";
      bar_blur = true;
      bar_padding = 12;
      bar_button_padding = 9;

      "hyprbars-button" = [
        "rgb(ff4040), 13, , hyprctl dispatch killactive"
        "rgb(eeee11), 13, , hyprctl dispatch fullscreen 1"
      ];
    };

    overview = {
      gapsIn = 4;
      gapsOut = 20;
      panelHeight = 160;
    };
  };
}