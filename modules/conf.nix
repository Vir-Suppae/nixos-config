{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ../hosts/hardware-configuration.nix
      (inputs.wrappers.lib.getInstallModule {
        name = "wezterm";
        value = inputs.wrappers.lib.wrapperModules.wezterm;
      })
      (inputs.wrappers.lib.getInstallModule {
        name = "wrapped-git";
        value = inputs.wrappers.lib.wrapperModules.git;
      })
      (inputs.wrappers.lib.getInstallModule {
        name = "opencode";
        value = inputs.wrappers.lib.wrapperModules.opencode;
      })
    ];

  wrappers.wezterm = {
    enable = true;
    "wezterm.lua".path = ./configs/wezterm.lua;
  };
  wrappers.wrapped-git = {
      enable = true;
      settings = {
        user.name = "Vir-Suppae";
        user.email = "vir.suppae@gmail.com";
        pull.rebase = true;
        init.defaultBranch = "main";
      };
  };
  wrappers.opencode.enable = true;


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
    packages = [
      brave
      fastfetch
      eza
      wezterm
      ripgrep
      fd
      bat
      gh
      fuzzel
      brightnessctl
      spotify-player
      blender
      rclone
      clang
      helix
      libresprite
      tiled
      swaybg
      luakit
      blockbench
      wayland
      wayland-scanner
      wayland-utils
      wl-clipboard
      cliphist
      grim
      slurp
      swappy
      mako
      wev
      libxkbcommon
    ];
  };

  programs.fish.enable = true;

  system.stateVersion = "26.05";

}
