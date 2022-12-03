{ config, pkgs, ... }:

{
  imports = [ ./sh.nix ];

  programs.home-manager.enable = true;
  home = {
    homeDirectory = "/home/vad";
    stateVersion = "22.11";
    username = "vad";
  };

  services.gpg-agent = {
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableSshSupport = true;
    enable = true;
  };

  home.packages = with pkgs; [
    gnupg
  ];
}
