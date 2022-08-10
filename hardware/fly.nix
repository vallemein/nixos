{ config, lib, pkgs, modulesPath, ... }:

{
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  # boot.initrd.luks.devices = {
  #   root = {
  #     device = "/dev/nvme0n1p6";
  #     preLVM = true;
  #   };
  # };

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/2a00fb84-22b9-47ed-827e-777805563c79";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/B8AB-8C36";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/eb9e62f0-bd61-4a95-ac12-b72cb644400b"; }];

  networking.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
