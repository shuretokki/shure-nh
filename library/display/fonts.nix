{ pkgs, inputs, ... }: {
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf

    inputs.apple-fonts.packages.${pkgs.system}.sf-pro
    inputs.apple-fonts.packages.${pkgs.system}.sf-mono
    inputs.apple-fonts.packages.${pkgs.system}.ny
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "New York" "Liberation Serif" "Noto Serif" ];
      sansSerif = [ "SF Pro Display" "Liberation Sans" "Noto Sans" ];
      monospace = [ "SF Mono" "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}