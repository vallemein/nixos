{ config, lib, pkgs, ... }:

{
  config = {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];

    services.xserver = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      xkbOptions = "grp:caps_toggle";
      videoDrivers = [ "nvidia" ];
      layout = "us,ru";
      enable = true;
    };
  };
}
