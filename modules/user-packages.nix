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
      helix
      libresprite
      tiled
      swaybg
      luakit
      blockbench
      wayland-utils
      wl-clipboard
      cliphist
      grim
      slurp
      swappy
      mako
      wev
      nixd
    ];
  };
}
