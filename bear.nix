{ config, pkgs, ... }:

{
  imports =
    [ ./hardware/bear.nix ./common.nix ./modules/yggdrasil.nix ./modules/gui.nix ./modules/privacy.nix ./modules/ipfs.nix ./modules/bluetooth.nix ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  virtualisation.docker.enable = true;

  networking.hostName = "bear";
}
