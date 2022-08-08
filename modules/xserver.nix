{ config, lib, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs.unstable; [
      nautilus
      gnome-photos
      gnome-console
      gnome-screenshot
      gnome-system-monitor
      gnomeExtensions.yakuake
      gnomeExtensions.gsconnect
    ];

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];

    services = {
      xserver = {
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;
        xkbOptions = "grp:caps_toggle";
        videoDrivers = [ "nvidia" ];
        layout = "us,ru";
        enable = true;
      };

      gnome = {
        core-utilities.enable = false;
        tracker-miners.enable = false;
        tracker.enable = false;
        games.enable = false;
      };

      hardware.bolt.enable = false;
    };
  };
}
