{
  services = {
    logind.settings.Login.HandleLidSwitch = "ignore";
    xserver.xkb = {
      layout = "us";
      variant = "";
      options = "compose:caps";
    };
    printing.enable = true;
    tuned.enable = true;
    upower.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    openssh = {
      enable = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish.enable = true;
    };
  };
}
