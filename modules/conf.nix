{
  imports = [
    ../hosts/hardware-configuration.nix
    ./packages.nix
    ./boot.nix
    ./networking.nix
    ./localization.nix
    ./hardware.nix
    ./services.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security.rtkit.enable = true;

  users.users."vir-suppae" = {
    isNormalUser = true;
    description = "Zeke Vandenberg";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = "26.05";

}
