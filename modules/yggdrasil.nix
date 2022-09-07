{ config, lib, pkgs, ... }:

{
  config = {
    services.yggdrasil = {
      persistentKeys = false;
      enable = true;

      settings = {
        Peers = [
          "tls://ygg-ny-us.incognet.io:8884"
          "tcp://ygg-nv-us.incognet.io:8883"
          "tcp://kazi.peer.cofob.ru:18000"
          "tcp://tasty.chowder.land:9002"
          "tcp://itcom.multed.com:7991"
          "tcp://ygg.loskiq.dev:17313"
          "tls://ygg.averyan.ru:8362"
          "tcp://94.130.203.208:5999"
          "tls://54.37.137.221:11129"
          "tls://ygg.mkg20001.io:443"
          "tcp://ygg.mkg20001.io:80"
        ];

        NodeInfoPrivacy = true;
        IfName = "ygg0";
      };
    };
  };
}
