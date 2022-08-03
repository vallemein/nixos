{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs.unstable; [
    xonotic
    superTuxKart
  ];
}
