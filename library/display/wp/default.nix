{ pkgs, vars, ... }: {
  home.packages = [ pkgs.swww ];

  systemd.user.services.swww = {
    Unit = {
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.swww}/bin/swww-daemon";
      ExecStartPost = "${pkgs.swww}/bin/swww img /home/${vars.username}/${vars.wallpaperDir}/001.jpg --transition-type grow --transition-pos top-right --transition-duration 2";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
