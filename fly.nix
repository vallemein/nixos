{ config, pkgs, ... }:

{
  imports =
    [ ./hardware/fly.nix ./common.nix ./modules/yggdrasil.nix ./modules/gui.nix ./modules/privacy.nix ./modules/ipfs.nix ./modules/bluetooth.nix ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = {
      root = {
        device = "/dev/nvme0n1p5";
        preLVM = true;
      };
  };

  virtualisation.docker.enable = true;

  networking.networkmanager.enable = true;
#  networking.networkmanager.unmanaged = [
#    "except:type:wwan" "except:type:gsm"
#  ];
#  networking.wireless.enable = true;
#  networking.wireless.userControlled.enable = true;

  networking.hostName = "fly";
}
