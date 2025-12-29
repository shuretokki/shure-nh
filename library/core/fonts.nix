{ pkgs, inputs, ... }: {
  fonts.fontDir.enable = true;
  fonts.enableDefaultPackages = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf

    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    nerd-fonts.meslo-lg
    nerd-fonts.hack

    inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro
    inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-mono
    inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.ny

    inter
    roboto
    roboto-mono
    open-sans
    lato
    montserrat
    poppins
    source-sans-pro
    source-code-pro
    ubuntu-classic

    fira
    fira-code
    cascadia-code
    iosevka
    victor-mono

    eb-garamond
    libre-baskerville
    crimson-pro
    merriweather

    source-han-sans
    source-han-serif
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "New York" "Liberation Serif" "Noto Serif" ];
      sansSerif = [ "SF Pro Rounded" "Inter" "Noto Sans" ];
      monospace = [ "SF Mono" "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}