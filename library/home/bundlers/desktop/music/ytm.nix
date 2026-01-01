{ lib, pkgs, config, inputs, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;

  colorOverrides = ''
    html:not(.style-scope) {
      --ctp-rosewater: ${colors.base06};
      --ctp-flamingo: ${colors.base0F};
      --ctp-pink: ${colors.base0E};
      --ctp-mauve: ${colors.base0E};
      --ctp-red: ${colors.base08};
      --ctp-maroon: ${colors.base08};
      --ctp-peach: ${colors.base09};
      --ctp-yellow: ${colors.base0A};
      --ctp-green: ${colors.base0B};
      --ctp-teal: ${colors.base0C};
      --ctp-sky: ${colors.base0C};
      --ctp-sapphire: ${colors.base0D};
      --ctp-blue: ${colors.base0D};
      --ctp-lavender: ${colors.base07};
      --ctp-text: ${colors.base05};
      --ctp-subtext1: ${colors.base04};
      --ctp-subtext0: ${colors.base04};
      --ctp-overlay2: ${colors.base03};
      --ctp-overlay1: ${colors.base03};
      --ctp-overlay0: ${colors.base02};
      --ctp-surface2: ${colors.base02};
      --ctp-surface1: ${colors.base01};
      --ctp-surface0: ${colors.base01};
      --ctp-base: ${colors.base00};
      --ctp-mantle: ${colors.base00};
      --ctp-crust: ${colors.base00};
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
