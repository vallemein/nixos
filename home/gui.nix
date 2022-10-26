{ pkgs, ... }:

{
  imports = [ ./apps.nix ./dev.nix ];

  programs.terminator = {
    enable = true;
    config = {
      global_config = {
        borderless = true;
        title_font = "DejaVu Sans Mono 7";
      };
      profiles.default = {
        font = "Fixed 8";
        use_system_font = false;
        background_color = "#212121";
      };
    };
  };

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
