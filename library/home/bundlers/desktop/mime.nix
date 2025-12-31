{ lib, vars, ... }:
let
  browserDesktop = if vars.browser == "zen" then "zen-beta" else vars.browser;
in {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = lib.mkForce "${browserDesktop}.desktop";
      "x-scheme-handler/http" = lib.mkForce "${browserDesktop}.desktop";
      "x-scheme-handler/https" = lib.mkForce "${browserDesktop}.desktop";
      "x-scheme-handler/about" = lib.mkForce "${browserDesktop}.desktop";
      "x-scheme-handler/unknown" = lib.mkForce "${browserDesktop}.desktop";
    };
  };
}
