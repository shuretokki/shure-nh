# https://wiki.hypr.land/Configuring/Keywords/#exec-once
{ pkgs, ... }: {
  exec-once = [
    "${pkgs.vicinae}/bin/vicinae daemon"
    "hyprsunset"
    "swayosd-server"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
  ];
}
