{ lib, vars, ... }: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = lib.mkForce "${vars.browser}.desktop";
      "x-scheme-handler/http" = lib.mkForce "${vars.browser}.desktop";
      "x-scheme-handler/https" = lib.mkForce "${vars.browser}.desktop";
      "x-scheme-handler/about" = lib.mkForce "${vars.browser}.desktop";
      "x-scheme-handler/unknown" = lib.mkForce "${vars.browser}.desktop";
    };
  };
}
