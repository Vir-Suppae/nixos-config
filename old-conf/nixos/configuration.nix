{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."luks-a53d4aa0-0e45-494b-836b-d316366431b7".device = "/dev/disk/by-uuid/a53d4aa0-0e45-494b-836b-d316366431b7";
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ intel-media-driver ];
  };
  hardware.bluetooth.enable = true;

  programs.labwc.enable = true;
  programs.mango.enable = true;

  services.logind.settings.Login.HandleLidSwitch = "ignore";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "compose:caps";
  };

  services.printing.enable = true;

  services.tuned.enable = true;

  services.upower.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users."vir-suppae" = {
    isNormalUser = true;
    description = "Zeke Vandenberg";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = [
    pkgs.gtk3
  ];
  environment.etc."mango/config.conf".source =
    "${config.programs.mango.package}/etc/mango/config.conf";

  system.stateVersion = "26.05";

}
