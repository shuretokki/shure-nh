{ config, pkgs, vars, lib, ... }:
let
  colors = config.lib.stylix.colors;

  # base config can be here, or fully driven by theme.
  # using mkMerge to allow theme to override/extend settings.
  baseSettings = {
      mainBar = {
        "reload_style_on_change" = true;
        "layer" = "top";
        "position" = "top";
        "height" = 26;
        "margin-top" = 4;
        "modules-left" = [ "hyprland/workspaces" ];
        "modules-center" = [ "mpris" ];
        "modules-right" = [ "network" "pulseaudio" "battery" "clock" ];

        "hyprland/workspaces" = {
          "on-click" = "activate";
          "active-only" = false;
          "all-outputs" = true;
          "format" = "{name}";
          "persistent-workspaces" = { "*" = 5; };
        };

        "cpu" = {
          "interval" = 5;
          "format" = "󰍛";
          "on-click" = "${vars.terminal} -e btop";
        };

        "memory" = {
          "interval" = 5;
          "format" = "󰘚";
          "on-click" = "${vars.terminal} -e btop";
        };

        "network" = {
          "format-wifi" = "";
          "format-ethernet" = "󰈀";
          "format-disconnected" = "󰖪";
          "tooltip-format" = "{essid} ({signalStrength}%)";
          "on-click" = "nm-connection-editor";
        };
        "pulseaudio" = {
          "format" = "{icon}";
          "format-muted" = "󰝟";
          "format-icons" = { "default" = [ "󰕿" "󰖀" "󰕾" ]; };
          "on-click" = "pavucontrol";
          "tooltip-format" = "{volume}%";
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}";
          "format-charging" = "󰂄";
          "format-plugged" = "󰂄";
          "format-icons" = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰁿" "󰂁" "󰂂" "󰁹" ];
          "tooltip-format" = "{capacity}%";
        };
        "clock" = {
          "format" = "{:%H:%M}";
          "tooltip-format" = "{:%A, %B %d, %Y}";
        };
        "mpris" = {
          "format" = "{player_icon} {title} - {artist}";
          "format-paused" = "{status_icon} <i>{title} - {artist}</i>";
          "player-icons" = { "default" = "󰐊"; "spotify" = ""; };
          "status-icons" = { "paused" = "󰏤"; };
          "max-length" = 40;
        };
      };
  };
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    # merge base settings with theme-specific config
    settings = lib.mkMerge [ baseSettings config.theme.waybar.config ];

    style = ''
      * {
          font-family: "${config.stylix.fonts.monospace.name}";
          font-size: 12px;
          min-height: 0;
      }

      window#waybar {
          background-color: transparent;
          color: #${colors.base05};
      }

      #workspaces {
          background-color: #${colors.base00};
          margin-top: 5px;
          margin-bottom: 5px;
          margin-left: 5px;
          border-radius: 0px;
      }

      #workspaces button {
          padding: 0px 8px;
          color: #${colors.base05};
          border-radius: 0px;
      }

      #workspaces button.active {
          background-color: #${colors.base0D};
          color: #${colors.base00};
      }

      #workspaces button.urgent {
          background-color: #${colors.base08};
          color: #${colors.base00};
      }

      #network,
      #pulseaudio,
      #custom-battery,
      #battery,
      #clock,
      #mpris {
          background-color: #${colors.base00};
          padding: 0px 4px;
          margin-top: 5px;
          margin-bottom: 5px;
          margin-right: 5px;
      }

      #mpris { padding: 0px 32px; }
      #clock { font-weight: 700; }

      #battery.charging, #battery.plugged { color: #${colors.base0B}; }
      #network.disconnected { color: #${colors.base08}; }

      tooltip {
          padding: 2px;
          background-color: #${colors.base00};
          border: 1px solid #${colors.base0D};
      }
      tooltip label { color: #${colors.base05}; }

      ${config.theme.waybar.style}
    '';
  };
}
