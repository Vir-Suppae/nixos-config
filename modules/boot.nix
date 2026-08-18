{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.luks.devices."luks-a53d4aa0-0e45-494b-836b-d316366431b7".device = "/dev/disk/by-uuid/a53d4aa0-0e45-494b-836b-d316366431b7";
  };
}
