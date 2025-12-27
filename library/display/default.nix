{ config, pkgs, inputs, ... }:
let
    mouse-keybinds = import ./mouse-keybinds.nix { inherit pkgs; };
    keybinds = import ./keybinds.nix { inherit pkgs; };
    appearance = import ./appearance.nix;
    rules = import ./rules.nix;
in {
    programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };

    environment.systemPackages = with pkgs; [
        # swaync
        hyprshot
        hyprpaper
        vicinae
        libnotify
        wl-clipboard
        # polkit-kde-agent
    ];

    home-manager.users.shure = {
        imports = [ ./waybar.nix ];
        wayland.windowManager.hyprland = {
            enable = true;

            plugins = [
                inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
            ];

            settings = appearance // rules // {
                monitor = ",preferred,auto,1";

                exec-once = [
                    # "${pkgs.swaynotificationcenter}/bin/swaync"
                    "${pkgs.vicinae}/bin/vicinae daemon"

                    "wl-paste --type text --watch cliphist store"
                    "wl-paste --type image --watch cliphist store"
                ];

            env = [
                "XCURSOR_SIZE,24"
                "HYPRCURSOR_SIZE,24"
            ];

            input = {
                kb_layout = "us";
                follow_mouse = 1;
                touchpad = {
                    natural_scroll = true;
                };
            };

            bind = keybinds;
            bindm = mouse-keybinds;
        };
    };
};
}