{ ... }: {
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
