{ config, lib, pkgs, ... }:

{
  config = {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      permitRootLogin = "no";
      passwordAuthentication = false;
    };
    environment.systemPackages = [ pkgs.mosh ];
  };
}
