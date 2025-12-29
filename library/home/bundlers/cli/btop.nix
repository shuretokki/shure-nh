{ lib, ... }: {
  programs.btop = {
    enable = lib.mkDefault true;
    settings = {
      color_theme = lib.mkDefault "gruvbox_dark";
      theme_background = lib.mkDefault false;
      vim_keys = lib.mkDefault true;
    };
  };
}
