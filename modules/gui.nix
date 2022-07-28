{ config, pkgs, ... }:

{
  config = {
    fonts.fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      dina-font
      proggyfonts
    ];
    fonts.fontconfig.enable = true;

    sound.enable = true;
    hardware.pulseaudio.enable = true;
  };
}
