{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
  ];
}
