{ config, pkgs, ... }:

{
  home.username = "vir-suppae";
  home.homeDirectory = "/home/vir-suppae";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ./git.nix
    ./fish.nix
    ./wezterm.nix
    ./packages.nix
    ./opencode.nix
    ./tmux.nix
    ./wayland-tools.nix
  ];
}
