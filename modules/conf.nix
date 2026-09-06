{
  imports = [
    ../hosts/hardware-configuration.nix
    ./packages.nix
    ./boot.nix
    ./networking.nix
    ./localization.nix
    ./hardware.nix
    ./services.nix
    ./user-packages.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security.rtkit.enable = true;

  users.users."vir-suppae" = {
    isNormalUser = true;
    description = "Zeke Vandenberg";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.users."luanti" = {
    isSystemUser = true;
    group = "luanti";
    home = "/var/lib/luanti";
    createHome = true;
  };

  users.groups.luanti = {};

  system.stateVersion = "26.05";

}
