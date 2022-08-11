{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt
    rnix-lsp
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = with pkgs.unstable.vscode-extensions; [
      ms-ceintl.vscode-language-pack-ru
      github.github-vscode-theme
      shardulm94.trailing-spaces
      yzhang.markdown-all-in-one
      bradlc.vscode-tailwindcss
      editorconfig.editorconfig
      WakaTime.vscode-wakatime
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      wix.vscode-import-cost
      svelte.svelte-vscode
      mhutchie.git-graph
      bierner.emojisense
      jnoortheen.nix-ide
      tyriar.sort-lines
      ms-python.python
      eamodio.gitlens
      golang.go
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-todo-highlight";
        publisher = "wayou";
        version = "1.0.5";
        sha256 = "CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
      }
      {
        name = "gitlab-workflow";
        publisher = "GitLab";
        version = "3.47.2";
        sha256 = "VeL3yvfaNIHUPaZHDxSE8pbdh4c93uMjhSMv2PWR6ts=";
      }
      {
        name = "direnv";
        publisher = "mkhl";
        version = "0.6.1";
        sha256 = "5/Tqpn/7byl+z2ATflgKV1+rhdqj+XMEZNbGwDmGwLQ=";
      }
      {
        name = "vscode-gitweblinks";
        publisher = "reduckted";
        version = "2.7.0";
        sha256 = "GZYFO0EDcD2v/Vf37NuXQQiv5iyqWSJm8CSzd2udoxY=";
      }
    ];
    userSettings = {
      "nix.enableLanguageServer" = true;
      "svelte.enable-ts-plugin" = true;

      # Suggest faster
      "editor.quickSuggestions" = {
        "strings" = true;
      };

      "diffEditor.ignoreTrimWhitespace" = false;
      "files.autoSave" = "afterDelay";

      # Git settings
      "git.enableSmartCommit" = true;
      "git.branchPrefix" = "cofob-";
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "git.autoStash" = true;
      "git.branchProtection" = [
        "master"
        "main"
      ];
      "git.branchRandomName.enable" = true;
      "git.fetchOnPull" = true;
      "git.mergeEditor" = true;

      # Git lens
      "gitlens.currentLine.enabled" = true;
      "gitlens.statusBar.enabled" = true;
      "gitlens.codeLens.enabled" = true;

      # Git web links config
      "gitweblinks.useShortHash" = true;
      "gitweblinks.gitLabEnterprise" = [
        {
          "http" = "https://git.averyan.ru";
          "ssh" = "git@git.averyan.ru";
        }
        {
          "http" = "https://git.frsqr.xyz";
          "ssh" = "git@git.averyan.ru";
        }
      ];

      # Formatter settings
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;
      };
      "[svelte]" = {
        "editor.defaultFormatter" = "svelte.svelte-vscode";
        "editor.formatOnSave" = true;
      };

      # Set editor theme
      "workbench.colorTheme" = "GitHub Light Default";
      # Disable welcome screen
      "workbench.startupEditor" = "none";
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "cofob";
    userEmail = "cofob@riseup.net";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      user.signingkey = "5F3D9D3DECE08651DE14D29FACAD4265E193794D";
      commit.gpgsign = true;
      tag.gpgsign = true;
      url = {
        "git@github.com:" = {
          insteadOf = [
            "github:"
            "gh:"
          ];
        };
        "git@codeberg.org:" = {
          insteadOf = [
            "codeberg:"
            "cb:"
          ];
        };
        "git@git.sr.ht:" = {
          insteadOf = [
            "sourcehut:"
            "srht:"
            "sh:"
          ];
        };
        "git@git.averyan.ru:" = {
          insteadOf = [
            "averyan:"
            "git:"
          ];
        };
        "git@git.averyan.ru:firesquare/" = {
          insteadOf = [
            "firesquare:"
            "frsqr:"
            "fs:"
          ];
        };
      };
    };
  };
}
