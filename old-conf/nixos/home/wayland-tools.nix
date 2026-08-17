{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
  ];
}
