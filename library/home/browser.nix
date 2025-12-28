{ inputs, pkgs, vars, ... }: {
  imports = [
    (if vars.browser == "zen" then inputs.zen-browser.homeModules.beta else { })
  ];

  home.packages = with pkgs; 
    (if vars.browser == "firefox" then [ firefox ] else []) ++
    (if vars.browser == "chromium" then [ chromium ] else []);

  home.sessionVariables = {
    BROWSER = vars.browser;
  };
}
