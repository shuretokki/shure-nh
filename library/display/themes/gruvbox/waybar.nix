{ colors, ... }: {
  borderRadius = "0px";
  barHeight = 26;
  moduleSpacing = 5;

  css = ''
    #workspaces button {
        border-radius: 0px;
    }
    #network, #pulseaudio, #battery, #clock, #mpris {
        border-radius: 0px;
    }
  '';
}
