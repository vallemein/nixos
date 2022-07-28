{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kotatogram-desktop
    libreoffice-fresh
    element-desktop
    bitwarden
    firefox
    ripcord
  ];
}
