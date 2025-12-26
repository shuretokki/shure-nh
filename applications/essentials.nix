{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        spotify
        typora
        nautilus
        warp-terminal
        lazydocker
        btop
        eza
        zoxide
        wget
        curl
        git
        ripgrep
    ];
}