{ config, pkgs, ... }:

{
  imports =
    [ ./hardware/bear.nix ./common.nix ./modules/yggdrasil.nix ./modules/gui.nix ./modules/xserver.nix ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  virtualisation.docker.enableWatchtower = true;
  virtualisation.docker.enable = true;

  security.sudo.wheelNeedsPassword = false;

  services = {
    i2pd = {
      enable = true;
      enableIPv6 = true;
      proto.http.enable = true;
      proto.httpProxy.enable = true;
      proto.httpProxy.outproxy = "http://acetone.i2p:8888";
      proto.httpProxy.inbound.length = 1;
      proto.httpProxy.outbound.length = 1;
    };

    tor = {
      enable = true;
      tsocks.enable = true;
    };

    ipfs = {
      enable = true;
      localDiscovery = true;
      enableGC = true;
      autoMount = true;
      emptyRepo = true;
    };

    blueman.enable = true;
  };
  hardware.opengl.enable = true;

  networking.hostName = "bear";
}
