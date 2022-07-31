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
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.enableWatchtower = true;

  security.sudo.wheelNeedsPassword = false;

  services = {
    xserver = {
      enable = true;
      layout = "us,ru";
      xkbOptions = "grp:caps_toggle";
      desktopManager.pantheon.enable = true;
      displayManager.lightdm.enable = true;
      videoDrivers = [ "nvidia" ];
    };

    i2pd = {
      enable = true;
      proto.http.enable = true;
      proto.httpProxy.enable = true;
      proto.httpProxy.outproxy = "http://acetone.i2p:8888";
      proto.httpProxy.inbound.length = 1;
      proto.httpProxy.outbound.length = 1;
    };
    blueman.enable = true;
  };
  hardware.opengl.enable = true;

  networking.hostName = "bear";
}
