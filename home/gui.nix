{ pkgs, ... }:

{
  imports = [ ./apps.nix ./dev.nix ];

  programs.kitty.enable = true;

  home.packages = with pkgs; [
    noto-fonts-emoji
    liberation_ttf
    dejavu_fonts
    freefont_ttf
    meslo-lgs-nf
    gyre-fonts
    unifont
    discord
    custom.deta
    bottles
    obsidian
    obs-studio
    termusic
    mpv
  ];
}
