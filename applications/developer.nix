{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vscode-fhs
    gcc
    gnumake
    nodejs
  ];

  environment.variables = {
    EDITOR = "nano";
    VISUAL = "nano";
  };

  programs.bash.shellAliases = {
  };
}