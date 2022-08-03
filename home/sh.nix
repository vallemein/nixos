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
    publicKeys = [
      {
        # My key
        source = ./configs/gpg/cofob.txt;
        trust = 5;
      }
      {
        # Averyanalex
        source = ./configs/gpg/alex.txt;
        trust = 4;
      }
    ];
  };

  programs.vim = {
    enable = true;
    settings = {
      mouse = "n";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.exa = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;

    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;

    shellAliases = {
      ls = "${pkgs.exa}/bin/exa --icons";
      la = "${pkgs.exa}/bin/exa --icons -la";
      lt = "${pkgs.exa}/bin/exa --icons --tree";

      nixupd = ''sudo rm -rf /root/.cache && sudo nixos-rebuild switch --flake "git+https://codeberg.org/cofob/nixos"'';
      tnixupd = "sudo nixos-rebuild switch --flake .";
      find_port = "sudo netstat -tulnp | grep";
      find_proc = "sudo ps -aux | grep";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "git-auto-fetch"
        "docker"
        "docker-compose"
        "z"
        "zsh-interactive-cd"
      ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./configs/p10k-config;
        file = "p10k.zsh";
      }
    ];
  };
}
