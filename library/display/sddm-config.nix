{ config, pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = "SilentSDDM";
    extraPackages = with pkgs.kdePackages; [
      qtmultimedia
      qtsvg
      qt5compat
      qtdeclarative
      qtvirtualkeyboard
      qtwayland
      layer-shell-qt
    ];
    settings = {
      General = {
        InputMethod = "qtvirtualkeyboard";
        GreeterEnvironment = "QT_IM_MODULE=qtvirtualkeyboard${pkgs.lib.optionalString config.hardware.nvidia.modesetting.enable ",LIBVA_DRIVER_NAME=nvidia,QT_MULTIMEDIA_PREFERRED_PLUGINS=ffmpeg"}";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    (import ./sddm.nix {
      inherit pkgs;
      background = null;
    })
  ];
}
