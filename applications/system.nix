{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        docker
        blueman
        wireplumber
        pamixer
        pavucontrol
        wtype
        easyeffects
        networkmanagerapplet
        qt6Packages.fcitx5-configtool
    ];
}
