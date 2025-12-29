{ lib, pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = {
    enable = lib.mkDefault true;
    theme = lib.mkDefault spicePkgs.themes.sleek;
    colorScheme = lib.mkDefault "AyuDark";
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle
      hidePodcasts
      adblock
    ];
  };

  home.packages = with pkgs; [ youtube-music ];
}
