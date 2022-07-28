{ pkgs, ... }:

{
  imports = [ ./apps.nix ./dev.nix ];

  home.packages = with pkgs; [
    dejavu_fonts
    freefont_ttf
    gyre-fonts
    liberation_ttf
    unifont
    noto-fonts-emoji
    meslo-lgs-nf
  ];
}
