{ args, config, lib, pkgs, ... }:

{
  nix = {
    useSandbox = true;
    autoOptimiseStore = true;
    readOnlyStore = true;
    allowedUsers = [ "@wheel" ];
    trustedUsers = [ "@wheel" ];
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d --max-freed $((64 * 1024**3))";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  system = {
    stateVersion = "22.05";
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      flake = "git+https://codeberg.org/cofob/nixos";
      dates = "4:45";
    };
    copySystemConfiguration = true;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    htop
    ncdu
    tmux
    terminus_font
    pastebinit
    wget
  ];

  environment.shellAliases = {
    nixupd = ''
      sudo rm -rf /root/.cache && sudo nixos-rebuild switch --flake "git+https://codeberg.org/cofob/nixos"'';
    tnixupd = "sudo nixos-rebuild switch --flake .";
  };

  console = {
    font = "ter-sun16";
  };

  boot.cleanTmpDir = true;
  boot.tmpOnTmpfs = true;

  services = {
    openssh = {
      enable = true;
      ports = [ 22 ];
      permitRootLogin = "no";
      passwordAuthentication = false;
    };

    fstrim.enable = true;
  };

  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  age.secrets.password-cofob.file = ./secrets/passwords/cofob.age;
  users = {
    mutableUsers = false;
    users.cofob = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      uid = 1000;
      passwordFile = config.age.secrets.password-cofob.path;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIETMEzhigdZelWae3V4tQ7/LXsub39SRG2X+jPMeoHMx"
      ];
    };
  };

  networking.nameservers = [ "8.8.8.8" "9.9.9.9" ];

  time.timeZone = "Etc/GMT+7";
}
