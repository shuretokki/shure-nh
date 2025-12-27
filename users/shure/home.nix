{ config, pkgs, inputs, ... }: {
    imports = [
        ./wallpaper.nix
        inputs.zen-browser.homeModules.beta
        # or inputs.zen-browser.homeModules.twilight
        # or inputs.zen-browser.homeModules.twilight-official
    ];

    home.username = "shure";
    home.homeDirectory = "/home/shure";
    home.stateVersion = "25.11";

    home.pointerCursor = {
        gtk.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
    };

    home.packages = with pkgs; [
        bibata-cursors
    ];

    programs.bash = {
        enable = true;
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake ~/shure-nh";
            eza = "eza --icons";
        };
        profileExtra = ''
            if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
                exec uwsm start hyprland-uwsm.desktop
            fi
        '';
    };

    services.vicinae = {
        enable = true;

        systemd = {
            enable = true;
            environment = {
                USE_LAYER_SHELL = 1;
            };
        };

        settings = {
            close_on_focus_loss = true;
            consider_preedit = true;
            pop_to_root_on_close = true;
            favicon_service = "twenty";
            search_files_in_root = true;

            font = {
                normal = {
                size = 10.5;
                normal = "SF Pro Rounded";
                };
            };

            theme = {
                light = {
                name = "gruvbox-light";
                icon_theme = "default";
                };
                dark = {
                name = "gruvbox-dark";
                icon_theme = "default";
                };
            };

            launcher_window = {
                opacity = 0.88;
            };
        };
    };

    programs.git = {
        enable = true;
        extraConfig = {
            user.name = "Tri R. Utomo";
            user.email = "tri.r.utomo@gmail.com";
        };
    };

    programs.vscode = {
        enable = true;
        mutableExtensionsDir = true;
    };

    gtk = {
        enable = true;
        theme = {
            name = "Gruvbox-Dark";
            package = pkgs.gruvbox-gtk-theme;
        };
        iconTheme = {
            name = "Gruvbox-Plus-Dark";
            package = pkgs.gruvbox-plus-icons;
        };
    };

    qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "adwaita-dark";
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
        };
    };

    programs.zen-browser.enable = true;
}