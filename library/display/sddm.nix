{ pkgs, config, lib, ... }: {
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    theme = lib.mkIf config.theme.sddm.enable "${config.theme.sddm.theme}/share/sddm/themes/${config.theme.sddm.theme.name or "SilentSDDM"}";
    # Note: sddm theme path string usually needs the folder name inside share/sddm/themes
    # "silent-sddm" derivation installs to share/sddm/themes/SilentSDDM.
    # We might need to handle this name dynamically.
    # For now assuming the default theme outputs correctly.
  };

  environment.systemPackages = [ config.theme.sddm.theme ];
}
