{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [ 8080 ];
      allowedUDPPorts = [ 30000 ];
    };
  };
}
