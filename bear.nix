{ config, pkgs, ... }:

{
  imports =
    [ ./hardware/bear.nix ./common.nix ];

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

  virtualisation.docker.enable = true;

  users.users.cofob = {
    extraGroups = [ "docker" ];
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

    gnome = {
      gnome-keyring.enable = true;
      chrome-gnome-shell.enable = true;
      games.enable = false;
    };

    i2pd.enable = true;
    blueman.enable = true;
  };
  hardware.opengl.enable = true;

  networking.hostName = "bear";
}
