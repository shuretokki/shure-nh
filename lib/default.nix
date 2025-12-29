{ inputs }:
let
  lib = inputs.nixpkgs.lib;
  vars = import ../vars.nix;
in
{
  mkHost = {
    hostname,
    username,
    system ? "x86_64-linux",
    hostVars ? {},
    extraModules ? []
  }:
  let
    mergedVars = vars // hostVars // { inherit hostname username; };
  in
  lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; vars = mergedVars; };
    modules = [
      ../hosts/${hostname}
      ../users/${username}/nixos.nix

      inputs.stylix.nixosModules.stylix

      inputs.home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; vars = mergedVars; };
          sharedModules = [
            inputs.vicinae.homeManagerModules.default
          ];
          users.${username} = import ../users/${username}/home.nix;
          backupFileExtension = "backup";
        };
      }
    ] ++ extraModules;
  };
}
