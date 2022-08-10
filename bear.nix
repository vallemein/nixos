{ config, pkgs, ... }:

{
  imports =
    [ ./hardware/bear.nix ./common.nix ];

  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  virtualisation.docker.enable = true;

  networking.hostName = "bear";
}
