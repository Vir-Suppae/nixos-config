{inputs, pkgs, ...}:
{
  imports = [
    (inputs.wrappers.lib.getInstallModule { name = "wezterm"; value = inputs.wrappers.lib.wrapperModules.wezterm; })
    (inputs.wrappers.lib.getInstallModule { name = "wrapped-git"; value = inputs.wrappers.lib.wrapperModules.git; })
    (inputs.wrappers.lib.getInstallModule { name = "opencode"; value = inputs.wrappers.lib.wrapperModules.opencode; })
    (inputs.wrappers.lib.getInstallModule { name = "fuzzel"; value = inputs.wrappers.lib.wrapperModules.fuzzel; })
  ];

  wrappers = {
    wezterm = {
      enable = true;
      "wezterm.lua".path = ./configs/wezterm.lua;
    };
    wrapped-git = {
      enable = true;
      configFile.path = ./configs/git.ini;
    };
    opencode.enable = true;
    fuzzel = {
      enable = true;
      settings = {
        colors = {
          border = "00000000";
          background = "222223ff";
          selection = "00ffff44";
          selection-text = "00ffffff";
          text = "00cc88ff";
        };
        border = {
          radius = 0;
        };
      };
    };
  };

  programs = {
    labwc.enable = true;
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [gtk3];
}
