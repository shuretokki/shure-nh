{ pkgs, ... }: {
  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;

  # Auto-mount disks
  services.udiskie.enable = true;

  # Audio Effects Daemon
  services.easyeffects.enable = true;

  # Media Player Daemon
  services.playerctld.enable = true;

  home.packages = with pkgs; [
    pavucontrol
  ];
}
