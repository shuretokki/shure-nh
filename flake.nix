{
    description = "system config";

    nixConfig = {
        extra-substituters = [
            "https://hyprland.cachix.org"
            "https://vicinae.cachix.org"
        ];
        extra-trusted-public-keys = [
            "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
            "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
        ];
    };

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        hyprland.url = "github:hyprwm/Hyprland";
        vicinae.url = "github:vicinaehq/vicinae";

        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
        };

        vicinae-extensions = {
            url = "github:vicinaehq/extensions";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        spicetify-nix = {
            url = "github:Gerg-L/spicetify-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs = {
                # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
                # to have it up-to-date or simply don't specify the nixpkgs input
                nixpkgs.follows = "nixpkgs";
                home-manager.follows = "home-manager";
            };
        };

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        apple-fonts = {
            url = "github:Lyndeno/apple-fonts.nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { self, nixpkgs, home-manager, vicinae, apple-fonts, ... }@inputs:
    let
        vars = import ./vars.nix;
    in {
        nixosConfigurations.default= nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs vars; };
            modules = [
                ./hosts/desktop/default.nix

                home-manager.nixosModules.home-manager {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;

                        extraSpecialArgs = { inherit inputs vars; };
                        sharedModules = [ vicinae.homeManagerModules.default ];

                        users.${vars.username} = import ./users/home.nix;
                        backupFileExtension = "backup";
                    };
                }

            ];
        };
    };
}
