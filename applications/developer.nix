{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
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