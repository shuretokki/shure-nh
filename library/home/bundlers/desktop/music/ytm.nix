{ lib, pkgs, config, inputs, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;

  colorOverrides = ''
    html:not(.style-scope) {
      --ytm-rosewater: ${colors.base06};
      --ytm-flamingo: ${colors.base0F};
      --ytm-pink: ${colors.base0E};
      --ytm-mauve: ${colors.base0E};
      --ytm-red: ${colors.base08};
      --ytm-maroon: ${colors.base08};
      --ytm-peach: ${colors.base09};
      --ytm-yellow: ${colors.base0A};
      --ytm-green: ${colors.base0B};
      --ytm-teal: ${colors.base0C};
      --ytm-sky: ${colors.base0C};
      --ytm-sapphire: ${colors.base0D};
      --ytm-blue: ${colors.base0D};
      --ytm-lavender: ${colors.base07};
      --ytm-text: ${colors.base05};
      --ytm-subtext1: ${colors.base04};
      --ytm-subtext0: ${colors.base04};
      --ytm-overlay2: ${colors.base03};
      --ytm-overlay1: ${colors.base03};
      --ytm-overlay0: ${colors.base02};
      --ytm-surface2: ${colors.base02};
      --ytm-surface1: ${colors.base01};
      --ytm-surface0: ${colors.base01};
      --ytm-base: ${colors.base00};
      --ytm-mantle: ${colors.base00};
      --ytm-crust: ${colors.base00};
    }
  '';

  ytmTheme = pkgs.writeText "ytm-stylix.css" (colorOverrides + builtins.readFile ./ytm.css);
in {
  imports = [ inputs.youtube-music.homeManagerModules.default ];

  # YouTube Music
  # See more: https://h-banii.github.io/youtube-music-nix/pages/home-manager/
  programs.youtube-music = {
    enable = true;
    options.themes = [ ytmTheme ];

    # Plugins
    # See more: https://github.com/th-ch/youtube-music/wiki/Plugins
    plugins = {
        # adblocker = { enable = true; };
        # album-actions = { enable = true; };
        # notifications = { enable = true; };
        # shortcuts = { enable = true; };
        # sponsorblock = { enable = true; };
        # touchbar = { enable = true; };
        # t-visualizer = { enable = true; };
    };
  };
}
