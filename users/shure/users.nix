{ pkgs, vars, ... }: {
  users.users.${vars.username} = {
    isNormalUser = true; 
    description = vars.username;
    extraGroups = [ "networkmanager" "wheel" "input" "docker" "video" "audio" ];
    shell = pkgs.bash;
  };

  programs.bash.enable = true;
}