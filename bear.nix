{ config, pkgs, ... }:

{
  imports =
    [ ./hardware/bear.nix ./common.nix ./modules/yggdrasil.nix ./modules/gui.nix ./modules/zerotier.nix ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    evince.enable = false;
    calls.enable = false;
    gnome-documents.enable = false;
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.enableWatchtower = true;

  security.sudo.wheelNeedsPassword = false;

  services = {
    xserver = {
      enable = true;
      layout = "us,ru";
      xkbOptions = "grp:caps_toggle";
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      videoDrivers = [ "nvidia" ];
    };

    gnome = {
      gnome-keyring.enable = true;
      chrome-gnome-shell.enable = true;
      games.enable = false;
    };

    i2pd.enable = true;
    blueman.enable = true;
  };
  hardware.opengl.enable = true;

  networking.hostName = "bear";
}
