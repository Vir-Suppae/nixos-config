{ pkgs, lib, ... }:
{
  programs.wezterm = {
    enable = true;
    settings = {
      font_size = 9;
      default_prog = lib.generators.mkLuaInline ''{ '${pkgs.fish}/bin/fish', '-C', 'fastfetch'}'';
      color_scheme = "3024 (base16)";
      use_fancy_tab_bar = false;
      initial_cols = 128;
      initial_rows = 43;
    };
  };
}
