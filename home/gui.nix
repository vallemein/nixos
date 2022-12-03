{ pkgs, ... }:

{
  imports = [ ./apps.nix ./dev.nix ];

  home.packages = with pkgs; [
    noto-fonts-emoji
    liberation_ttf
    dejavu_fonts
    freefont_ttf
    gyre-fonts
    unifont
    cmus
    mpv
    # Screenshots
    maim
    xclip
    xdotool
    (pkgs.writeScriptBin "br" "xrandr --output eDP-1 --brightness $1")
  ];
}
