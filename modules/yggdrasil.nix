{ config, lib, pkgs, ... }:

{
  config = {
    services.yggdrasil = {
      enable = true;
      persistentKeys = false;

      config = {
        Peers = [
          "tcp://kazi.peer.cofob.ru:18000"
          "tls://ygg.averyan.ru:8362"
        ];

        IfName = "ygg0";
	      NodeInfoPrivacy = true;
      };
    };
  };
}
