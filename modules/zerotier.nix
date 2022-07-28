{ config, lib, pkgs, ... }:

{
  config = {
    services.zerotierone = {
      enable = true;
    };
  };
}
