{ pkgs, ... }: {
  exec-once = [
    "${pkgs.vicinae}/bin/vicinae daemon"
    "hyprsunset"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
  ];
}
