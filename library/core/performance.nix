{ config, pkgs, ... }: {
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    memoryMax = 8192; # 8GB cap
    priority = 100;
  };

  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
  };
}
