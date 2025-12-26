{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = ["/home/shure/shure-wp/001.jpg"];
      wallpaper = ["HDMI-A-1,/home/shure/shure-wp/001.jpg"];
    };
  };
}