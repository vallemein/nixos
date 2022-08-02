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
          "tcp://94.130.203.208:5999"
          "tcp://ygg.loskiq.dev:17313"
          "tcp://itcom.multed.com:7991"
          "tls://ygg-ny-us.incognet.io:8884"
          "tcp://tasty.chowder.land:9002"
          "tcp://ygg-nv-us.incognet.io:8883"
          "tls://54.37.137.221:11129"
          "tcp://ygg.mkg20001.io:80"
          "tls://ygg.mkg20001.io:443"
        ];

        IfName = "ygg0";
	      NodeInfoPrivacy = true;
      };
    };
  };
}
