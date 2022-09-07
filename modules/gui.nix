{ config, pkgs, lib, ... }:

{
  config = {
    services = {
      xserver = {
        enable = true;
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;
        xkbOptions = "grp:caps_toggle";
        layout = "us,ru";
      };

      hardware.bolt.enable = false;

      flatpak.enable = true;

      pipewire.enable = true;
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
    nixpkgs.config.pulseaudio = true;
  };
}
