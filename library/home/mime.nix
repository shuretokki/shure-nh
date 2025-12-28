{ ... }: {
    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "text/plain" = "code.desktop";
            "text/markdown" = "code.desktop";
            "x-scheme-handler/http" = "zen.desktop";
            "x-scheme-handler/https" = "zen.desktop";
            "x-scheme-handler/about" = "zen.desktop";
            "x-scheme-handler/unknown" = "zen.desktop";
            "inode/directory" = "org.gnome.Nautilus.desktop";
        };
    };
}
