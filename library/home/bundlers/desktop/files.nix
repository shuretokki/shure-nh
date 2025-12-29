{ lib, pkgs, vars, ... }: {
  home.packages = with pkgs; [
    nautilus
  ];

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = lib.mkDefault "org.gnome.Nautilus.desktop";
  };
}
