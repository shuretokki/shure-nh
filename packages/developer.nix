{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    nodejs
    python3
    nil
    nixpkgs-fmt
    direnv
    alejandra
  ];
}