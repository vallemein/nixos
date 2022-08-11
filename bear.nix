{ config, pkgs, lib, ... }:

{
  imports =
    [ ./hardware/bear.nix ./common.nix ];

  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nvidia-x11"
    "nvidia-settings"
  ];

  virtualisation.docker.enable = true;

  networking.hostName = "bear";
}
