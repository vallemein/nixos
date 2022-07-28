{ config, pkgs, ... }:

{
  imports = [ ./zsh.nix ];

  programs.home-manager.enable = true;
  home = {
    username = "cofob";
    homeDirectory = "/home/cofob";
    stateVersion = "22.05";
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  home.packages = with pkgs; [
    gnupg
  ];
}
