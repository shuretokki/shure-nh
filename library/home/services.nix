{ pkgs, ... }: {
  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;
  services.udiskie.enable = true;
  services.easyeffects.enable = true;
  services.playerctld.enable = true;

  home.packages = with pkgs; [
    pavucontrol
  ];
}
