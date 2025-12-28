{ pkgs, vars, ... }: {
  home.packages = with pkgs; 
    (if vars.terminal == "warp-terminal" then [ warp-terminal ] else []) ++
    (if vars.terminal == "kitty" then [ kitty ] else []) ++
    (if vars.terminal == "foot" then [ foot ] else []);

  home.sessionVariables = {
    TERMINAL = vars.terminal;
  };
}
