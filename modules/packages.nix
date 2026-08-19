{inputs, pkgs, ...}:
{
  imports = [
    (inputs.wrappers.lib.getInstallModule { name = "wezterm"; value = inputs.wrappers.lib.wrapperModules.wezterm; })
    (inputs.wrappers.lib.getInstallModule { name = "wrapped-git"; value = inputs.wrappers.lib.wrapperModules.git; })
    (inputs.wrappers.lib.getInstallModule { name = "opencode"; value = inputs.wrappers.lib.wrapperModules.opencode; })
  ];

  wrappers = {
    wezterm = {
      enable = true;
      "wezterm.lua".path = ./configs/wezterm.lua;
    };
    wrapped-git = {
      enable = true;
      settings = {
        user.name = "Vir-Suppae";
        user.email = "vir.suppae@gmail.com";
        pull.rebase = true;
        init.defaultBranch = "main";
      };
    };
    opencode.enable = true;
  };

  programs = {
    labwc.enable = true;
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [gtk3];
}
