# require updating the values below to match your setup.

{
  # used for home directory path, user creation
  username = "shure";

  # used in programs.git
  gitname = "Tri R. Utomo";
  email = "tri.r.utomo@gmail.com";

  # default applications
  # these are referenced throughout the config for default handlers
  browser = "zen";           # zen, chromium
  terminal = "warp-terminal"; # warp-terminal, alacritty, ghostty
  editor = "code";           # code, nvim, zed
  fileManager = "nautilus";  # nautilus
  musicPlayer = "spotify";   # spotify, youtube-music

  # used in library/core/locale.nix
  locale = "en_US.UTF-8";
  timezone = "Asia/Jakarta";

  # used in library/theme/
  theme = "default"; # default

  features = {
    # shell, git, development tools, TUI apps
    cli = true;

    # GUI apps, themes, window manager, fonts, audio
    # set to false for headless servers
    desktop = true;
  };
}
