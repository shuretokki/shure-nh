{ pkgs, ... }:
let
  theme = import ../themes/current.nix;
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        "reload_style_on_change" = true;
        "layer" = "top";
        "position" = "top";
        "spacing" = 0;
        "height" = 26;
        "margin-top" = 4;
        "margin-left" = 0;
        "margin-right" = 0;
        "modules-left" = [ "hyprland/workspaces" ];
        "modules-center" = [ "mpris" ];
        "modules-right" = [ "network" "pulseaudio" "battery" "clock" ];

        "hyprland/workspaces" = {
          "on-click" = "activate";
          "active-only" = false;
          "all-outputs" = true;
          "format" = "{name}";
          "persistent-workspaces" = {
            "*" = 5;
          };
        };

        "custom/omarchy" = {
          "format" = "<span font='omarchy'>\ue900</span>";
          "on-click" = "omarchy-menu";
          "on-click-right" = "xdg-terminal-exec";
          "tooltip-format" = "Omarchy Menu\n\nSuper + Alt + Space";
        };

        "custom/update" = {
          "format" = "";
          "exec" = "omarchy-update-available";
          "on-click" = "omarchy-launch-floating-terminal-with-presentation omarchy-update";
          "tooltip-format" = "Omarchy update available";
          "signal" = 7;
          "interval" = 21600;
        };

        "cpu" = {
          "interval" = 5;
          "format" = "󰍛";
          "on-click" = "xdg-terminal-exec btop";
        };

        "memory" = {
          "interval" = 5;
          "format" = "󰘚";
          "on-click" = "xdg-terminal-exec btop";
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
          "format-icons" = {
            "default" = [ "󰕿" "󰖀" "󰕾" ];
          };
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
          "player-icons" = {
            "default" = "󰐊";
            "spotify" = "";
          };
          "status-icons" = {
            "paused" = "󰏤";
          };
          "max-length" = 40;
        };
      };
    };
    style = ''
      * {
          font-family: "JetBrainsMono Nerd Font";
          font-size: 12px;
          min-height: 0;
      }

      window#waybar {
          background-color: transparent;
          color: #${theme.colors.fg};
      }

      #workspaces {
          background-color: #${theme.colors.bg};
          margin-top: 5px;
          margin-bottom: 5px;
          margin-left: 5px;
          border-radius: 0px;
      }

      #workspaces button {
          padding: 0px 8px;
          color: #${theme.colors.fg};
          border-radius: 0px;
      }

      #workspaces button.active {
          background-color: #${theme.colors.active_border};
          color: #${theme.colors.bg};
      }

      #workspaces button.urgent {
          background-color: #${theme.colors.red};
          color: #${theme.colors.bg};
      }

      #network,
      #pulseaudio,
      #custom-battery,
      #battery,
      #clock,
      #mpris {
          background-color: #${theme.colors.bg};
          border-radius: 0px;
          padding: 0px 4px;
          margin-top: 5px;
          margin-bottom: 5px;
          margin-right: 5px;
      }

      #mpris {
          padding: 0px 32px;
      }

      #clock {
          font-weight: 700;
      }

      #battery.charging,
      #battery.plugged {
          color: #${theme.colors.green};
          border-color: #${theme.colors.green};
      }

      #network.disconnected {
          color: #${theme.colors.red};
          border-color: #${theme.colors.red};
      }

      #custom-expand-icon {
          margin-right: 20px;
      }

      tooltip {
          padding: 2px;
          background-color: #${theme.colors.bg};
          border: 1px solid #${theme.colors.active_border};
      }

      tooltip label {
          color: #${theme.colors.fg};
      }

      #custom-update {
          font-size: 10px;
      }

      .hidden {
          opacity: 0;
      }

      #custom-screenrecording-indicator {
          min-width: 12px;
          margin-left: 8.75px;
          font-size: 10px;
      }

      #custom-screenrecording-indicator.active {
          color: #${theme.colors.red};
      }
    '';
  };
}
