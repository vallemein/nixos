{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt
  ];

  programs.git = {
    enable = true;
  };
}
