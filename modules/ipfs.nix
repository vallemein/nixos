{ config, lib, pkgs, ... }:

{
  config = {
    services = {
      ipfs = {
        enable = true;
        localDiscovery = true;
        enableGC = true;
        autoMount = true;
        emptyRepo = true;
      };
    };
  };
}

