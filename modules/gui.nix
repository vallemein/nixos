{ config, pkgs, lib, ... }:

{
  imports = [ ./mullvad.nix ];

  services = {
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      windowManager.i3.configFile = ./configs/i3.txt;
      displayManager.sddm.enable = true;
      xkbOptions = "grp:caps_toggle";
      layout = "us,ru";
      videoDrivers = [
        "nvidia"
  #      "nouveau"
  #      "modesetting"
  #      "fbdev"
      ];
    };

    gnome.gnome-keyring.enable = true;

    hardware.bolt.enable = false;

    pipewire.enable = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nvidia-x11"
    "nvidia-settings"
  ];

  programs.gnupg.agent.pinentryFlavor = "qt";

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
  nixpkgs.config.pulseaudio = true;
