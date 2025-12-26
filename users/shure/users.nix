{ pkgs, ... }: {
  users.users.shure = {
    isNormalUser = true; 
    description = "shure";
    extraGroups = [ "networkmanager" "wheel" "input" "docker" "video" "audio" ];
    shell = pkgs.bash;
  };

  programs.bash.enable = true;
}