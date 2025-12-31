{ lib, pkgs, vars, ... }: {
  home.packages = with pkgs; [
    warp-terminal
    ghostty
  ];

  programs.kitty = {
    enable = lib.mkDefault true;
    settings = {
      font_family = lib.mkForce vars.fontMono;
      font_size = lib.mkDefault vars.fontSize;
      enable_audio_bell = false;
    };
  };

  programs.alacritty = {
    enable = lib.mkDefault true;
    settings = {
      font.normal.family = lib.mkForce vars.fontMono;
      font.size = lib.mkDefault vars.fontSize;
    };
  };

  home.sessionVariables.TERMINAL = lib.mkDefault vars.terminal;
}
