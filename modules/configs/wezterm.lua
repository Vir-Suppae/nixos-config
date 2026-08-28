local wezterm = require 'wezterm'
local config = wezterm.config_builder and wezterm.config_builder() or {}

local hm_config = {
  ["color_scheme"] = "3024 (base16)",
  ["default_prog"] = ({ '/nix/store/q49zgix4r6h1mlnqndk8pkzxsmcg2j5n-fish-4.8.1/bin/fish', '-C', 'fastfetch'}),
  ["font_size"] = 9,
  ["initial_cols"] = 128,
  ["initial_rows"] = 43,
  ["use_fancy_tab_bar"] = false,
  ["enable_kitty_keyboard"] = true,
}
for k, v in pairs(hm_config) do
  config[k] = v
end


return config
