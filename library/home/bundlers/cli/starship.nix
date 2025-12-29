{ lib, ... }: {
  programs.starship = {
    enable = lib.mkDefault true;
    enableBashIntegration = lib.mkDefault true;
    settings = {
      format = lib.mkDefault "$directory$git_branch$git_status$cmd_duration$line_break$character";
      directory = {
        style = lib.mkDefault "bold #fabd2f";
        truncation_length = lib.mkDefault 3;
      };
      git_branch = {
        style = lib.mkDefault "bold #8ec07c";
        symbol = lib.mkDefault " ";
      };
      git_status = {
        style = lib.mkDefault "bold #fb4934";
      };
      character = {
        success_symbol = lib.mkDefault "[❯](bold #b8bb26)";
        error_symbol = lib.mkDefault "[❯](bold #fb4934)";
      };
      cmd_duration = {
        style = lib.mkDefault "bold #d3869b";
        min_time = lib.mkDefault 2000;
      };
    };
  };
}
