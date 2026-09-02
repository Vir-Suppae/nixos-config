{inputs, pkgs, config, ...}:
let
  unipicker = pkgs.callPackage ../packages/unipicker/package.nix {
    fuzzel = config.wrappers.fuzzel.wrapper;
  };
in
{
  imports = [
    (inputs.wrappers.lib.getInstallModule { name = "wezterm"; value = inputs.wrappers.lib.wrapperModules.wezterm; })
    (inputs.wrappers.lib.getInstallModule { name = "wrapped-git"; value = inputs.wrappers.lib.wrapperModules.git; })
    (inputs.wrappers.lib.getInstallModule { name = "opencode"; value = inputs.wrappers.lib.wrapperModules.opencode; })
    (inputs.wrappers.lib.getInstallModule { name = "fuzzel"; value = inputs.wrappers.lib.wrapperModules.fuzzel; })
    (inputs.wrappers.lib.getInstallModule { name = "ghostty"; value = inputs.wrappers.lib.wrapperModules.ghostty; })
    (inputs.wrappers.lib.getInstallModule { name = "kitty"; value = inputs.wrappers.lib.wrapperModules.kitty; })
    (inputs.wrappers.lib.getInstallModule { name = "helix"; value = inputs.wrappers.lib.wrapperModules.helix; })
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
    ghostty = {
      enable = true;
      settings = {
        font-size = 9;
        theme = "Carbonfox";
        selection-clear-on-copy = true;
        cursor-style = "block_hollow";
        command = "fish";
        window-width = 128;
        window-height = 40;
        window-show-tab-bar = "always";
      };
    };
    kitty = {
      enable = true;
      font.size = 9;
      settings = {
        cursor_shape = "underline";
        cursor_trail = 1;
        cursor_trail_start_threshold = 0;
        cursor_trail_color = "#00ff00";
        scrollback_lines = 500000;
        remember_window_size = "no";
        initial_window_width = "128c";
        initial_window_height = "40c";
        tab_bar_edge = "top";
        tab_bar_style = "powerline";
        tab_bar_min_tabs = 1;
        tab_activity_symbol = "⌬";
      };
      themeFile = "Carbonfox";
    };
    helix = {
      enable = true;
      themes = ''ao'''; 
    };
  };

  programs = {
    labwc.enable = true;
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [gtk3 unipicker];
}
