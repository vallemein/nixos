{ config, lib, pkgs, ... }:

{
  config = {
    services.openssh = {
      enable = false;
      ports = [ 22 ];
      permitRootLogin = "no";
      passwordAuthentication = false;
    };
    environment.systemPackages = [ pkgs.mosh ];
  };
}
