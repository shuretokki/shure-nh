{ config, pkgs, inputs, vars, ... }: {
    imports = [
        ../../library/home/global
        ../../library/home/vicinae.nix
    ];

    home.username = vars.username;
    home.homeDirectory = "/home/${vars.username}";
    home.stateVersion = "25.11";
}
