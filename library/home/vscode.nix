{ pkgs, ... }:
let
  theme = import ../../../library/display/themes/current.nix;
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    mutableExtensionsDir = true;
  };
}
