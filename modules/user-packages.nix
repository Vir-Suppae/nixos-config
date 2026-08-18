{ pkgs, ... }:
{
  users.users."vir-suppae" = {
    packages = with pkgs; [
      brave
      fastfetch
      eza
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
      nixd
    ];
  };
}
