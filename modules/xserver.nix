{ config, lib, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs.unstable; [
      gnome-console
      gnomeExtensions.gsconnect
      gnomeExtensions.yakuake
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
