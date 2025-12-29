{ lib, pkgs, inputs, vars, ... }: {
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.zen-browser.enable = lib.mkDefault true;
  programs.chromium = {
    enable = lib.mkDefault true;
    extensions = [
      # uBlock Origin
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
    ];
  };

  home.sessionVariables.BROWSER = lib.mkDefault vars.browser;
}
