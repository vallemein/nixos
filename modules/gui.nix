{ config, pkgs, lib, ... }:

{
  config = {
    environment.systemPackages = with pkgs.unstable.gnomeExtensions; [
      yakuake
      gsconnect
    ];

    environment.gnome.excludePackages = with pkgs.unstable.gnome; [
      yelp
      gedit
      cheese
      epiphany
      gnome-logs
      gnome-maps
      gnome-music
      simple-scan
      gnome-clocks
      gnome-weather
      gnome-calendar
      gnome-contacts
      gnome-calculator
      gnome-characters
      gnome-font-viewer
      pkgs.gnome-photos
      pkgs.gnome-connections
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
        tracker-miners.enable = false;
        tracker.enable = false;
        games.enable = false;
      };

      hardware.bolt.enable = false;
    };

    hardware.opengl.enable = true;

    fonts.fonts = with pkgs; [
      fira-code-symbols
      noto-fonts-emoji
      noto-fonts-cjk
      liberation_ttf
      proggyfonts
      noto-fonts
      fira-code
      dina-font
    ];
    fonts.fontconfig.enable = true;

    hardware.pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
    sound.enable = true;
  };
}
