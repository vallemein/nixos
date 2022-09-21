{ pkgs, ... }:

{
  imports = [ ./apps.nix ./dev.nix ];

  home.packages = with pkgs; [
    noto-fonts-emoji
    liberation_ttf
    dejavu_fonts
    freefont_ttf
    meslo-lgs-nf
    gyre-fonts
    unifont
    discord
  ];
}
