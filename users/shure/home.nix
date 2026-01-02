{ config, pkgs, inputs, vars, ... }: {
    imports = [
        ../../library/home/global
    ];

    home.username = vars.username;
    home.homeDirectory = "/home/${vars.username}";
    home.stateVersion = "25.11";

    programs.bash = {
        enable = true;
        shellAliases = {
            rebuild = "nh os switch";
            rebuild-test = "nh os test";
            update = "nh os switch --update";
            clean = "nh clean all --keep 5";
            gs = "git status";
            gd = "git diff";
            ga = "git add";
            gc = "git commit";
            gp = "git push";
            gl = "git log";
        };
    };
}
