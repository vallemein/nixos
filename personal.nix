{ config, pkgs, ... }:

{
  imports =
    [ ./hardware/personal.nix ./common.nix ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    evince.enable = false;
    calls.enable = false;
    gnome-documents.enable = false;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    dina-font
    proggyfonts
  ];

  users.users.cofob = {
    packages = with pkgs; [
      firefox
      vscode
      ripcord
      kotatogram-desktop
      element-desktop
      bitwarden
    ];
  };

  services = {
    xserver = {
      enable = true;
      layout = "us,ru";
      xkbOptions = "grp:caps_toggle";
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      videoDrivers = [ "nvidia" ];
    };

    yggdrasil = {
      enable = true;
      persistentKeys = false;

      config = {
        Peers = [
          "tcp://kazi.peer.cofob.ru:18000"
        ];

        IfName = "ygg0";
	      NodeInfoPrivacy = true;
      };
    };

    resolved = {
      enable = true;
      dnssec = "true";
      llmnr = "false";
    };

    i2pd.enable = true;

    gnome = {
      gnome-keyring.enable = true;
      chrome-gnome-shell.enable = true;
      games.enable = false;
    };
  };
  hardware.opengl.enable = true;

  networking.hostName = "bear";
  networking.networkmanager.enable = false;
  networking.useNetworkd = true;

  systemd.network = {
    enable = true;
    networks = {
      enp3s0 = {
        name = "enp3s0";
        dns = [
          "1.1.1.1"
          "8.8.8.8"
          "9.9.9.9"
        ];
      };
    };
  };
}
