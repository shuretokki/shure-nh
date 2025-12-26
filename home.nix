{ config, pkgs, ... }: {
    home.username = "shure";
    home.homeDirectory = "/home/shure";
    home.stateVersion = "25.11";
    programs.bash = {
        enable = true;
        shellAliases = {
            eza = "eza --icons";
        };
        profileExtra = ''
            if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
                exec uwsm start hyprland-uwsm.desktop
            fi
        '';
    };
}