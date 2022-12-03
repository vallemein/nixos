{ config, pkgs, lib, ... }:

{
  programs.bash.enable = true;
  programs.bash.initExtra = ''
    if [[ "$(tty)" != /dev/tty* && $(ps --no-header --pid=$PPID --format=comm) != "zsh" && -z $BASH_EXECUTION_STRING ]]; then
      exec zsh
    fi
  '';

  programs.bat.enable = true;

  programs.gpg = {
    enable = true;
    mutableKeys = false;
    mutableTrust = false;
  };

  programs.neovim = {
    enable = true;
  };

  programs.fzf = {
    enableZshIntegration = true;
    enable = true;
  };

  programs.exa = {
    enable = true;
  };

  programs.zsh = {
    enable = true;

    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;

    shellAliases = {
      nixupd = ''sudo rm -rf /root/.cache && sudo nixos-rebuild switch --flake "github:cofob/nixos"'';
      tnixupd = "sudo nixos-rebuild switch --flake . --fast -p test";
      tnix = "nixos-rebuild dry-build --flake .";
      nixclear = "sudo nix-store --gc && sudo nix-collect-garbage -d && nixupd";
      find_port = "sudo netstat -tulnp | grep";
      find_proc = "sudo ps -aux | grep";
      shell = "nix-shell --run 'zsh' -p";
      brightness = "xrandr --output eDP-1 --brightness";
    };

  };
}
