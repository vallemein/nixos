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
      device = "/dev/disk/by-uuid/f4e27fd8-e68b-4dbc-8873-9c395adccc0b";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/B8AB-8C36";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/47452dc1-7b2a-4c06-8d4f-064c356895fd"; }];

  networking.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
