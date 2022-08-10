{ config, lib, pkgs, modulesPath, ... }:
 
{
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
 
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/b3d744d7-6135-42d7-ae46-7d6a4ce16ec1";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B8AB-8C36";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/9ab6a7ee-48a3-4e7e-a021-4aa231503abd"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

