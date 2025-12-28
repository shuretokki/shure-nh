{ inputs, ... }: {
    imports = [
        inputs.zen-browser.homeModules.beta
        # or inputs.zen-browser.homeModules.twilight
        # or inputs.zen-browser.homeModules.twilight-official
    ];

    programs.starship = {
        enable = true;
        enableBashIntegration = true;
    };

    programs.zoxide = {
        enable = true;
        enableBashIntegration = true;
    };

    programs.zen-browser.enable = true;
}
