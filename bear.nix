{ config, pkgs, lib, ... }:

{
  imports =
    [ ./hardware/bear.nix ./common.nix ];

  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  virtualisation.docker.enable = true;

  services.xserver.resolutions = [
    {
      x = 1920;
      y = 1080;
    }
  ];

  networking = {
    nebula-global = {
      enable = true;
      isLighthouse = false;
    };

    hostName = "bear";
  };
}
