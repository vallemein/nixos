{ config, pkgs, lib, ... }:

{
  imports = [ ./mullvad.nix ];

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

  services.mullvad-vpn-custom.enable = true;

  services.syncthing = {
    enable = true;
    user = "cofob";
    dataDir = "/home/cofob";
    systemService = true;
    folders = {
      "/home/cofob/Documents/Learning" = {
        id = "documents-learning";
        devices = [ "huawei" ];
        versioning = {
          type = "simple";
          params.keep = "10";
        };
      };
      "/home/cofob/Music" = {
        id = "music";
        devices = [ "huawei" ];
        versioning = {
          type = "simple";
          params.keep = "10";
        };
      };
    };
    devices = {
      huawei = {
        id = "V3DPTUO-ESKOTAG-4QK5BH2-ZAVFNQI-RTLGIXX-KBYJ5NM-JPXGRDU-GTTOAQH";
      };
    };
  };
}
