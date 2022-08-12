{ config, pkgs, ... }:

{
  imports =
    [ ./hardware/fly.nix ./common.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.docker.enable = true;

  networking.networkmanager.enable = true;

  age.secrets.wg-aeza-fly.file = ./secrets/wg/aeza/fly.age;
  networking.wireguard.interfaces = {
    vpn0 = {
      ips = [ "10.66.66.3/32" ];
      privateKeyFile = config.age.secrets.wg-aeza-fly.path;
      peers = [
        {
          publicKey = "t/2RMwSMBXhBfJT8NoOmdn+RG5FWh5rUSGGcHLyt9BQ=";
          allowedIPs = [ "10.66.66.0/24" ];
          endpoint = "78.153.130.61:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };

  networking.hostName = "fly";
}
