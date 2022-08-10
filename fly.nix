{ config, pkgs, ... }:

{
  imports =
    [ ./hardware/fly.nix ./common.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.docker.enable = true;

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  networking.networkmanager.enable = true;

  networking.hostName = "fly";
}
