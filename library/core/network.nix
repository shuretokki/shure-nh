{ pkgs, ... }: {
  networking.networkmanager.enable = true;

  # Firewall settings (Optional: Open ports for development if needed)
  # networking.firewall.allowedTCPPorts = [ ... ];
}