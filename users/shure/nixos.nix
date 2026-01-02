{ pkgs, vars, ... }: {
  users.users.${vars.username} = {
    uid = 1000;
    isNormalUser = true;
    description = vars.username;
    extraGroups = [ "networkmanager" "wheel" "input" "docker" "video" "audio" "ydotool" ];
    shell = pkgs.bash;
  };

  programs.bash.enable = true;
}