{ config, lib, pkgs, modulesPath, ... }:
 
{
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
 
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/4307ddb0-55e3-4171-85d7-10f25d1dbe1f";
      fsType = "ext4";
    };
 
  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B8AB-8C36";
      fsType = "vfat";
    };
 
  swapDevices =
    [ { device = "/dev/disk/by-uuid/1b020237-6b44-4d9b-ae8c-3e6a0336d702"; }
    ];
 
  networking.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

