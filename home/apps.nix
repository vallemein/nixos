{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    qbittorrent
  ];

  manual.html.enable = true;

  programs.firefox = {
    enable = true;
  };
}
