{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    rnix-lsp
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = with pkgs.unstable.vscode-extensions; [
      golang.go
      eamodio.gitlens
      ms-python.python
      tyriar.sort-lines
      mhutchie.git-graph
      bierner.emojisense
      jnoortheen.nix-ide
      svelte.svelte-vscode
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      wix.vscode-import-cost
      WakaTime.vscode-wakatime
      bradlc.vscode-tailwindcss
      editorconfig.editorconfig
      github.github-vscode-theme
      shardulm94.trailing-spaces
      yzhang.markdown-all-in-one
      ms-ceintl.vscode-language-pack-ru
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

      "files.autoSave" = "afterDelay";
      "diffEditor.ignoreTrimWhitespace" = false;

      # Git settings
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "git.autofetch" = true;
      "git.branchPrefix" = "cofob-";
      "git.autoStash" = true;
      "git.branchProtection" = [
        "master"
        "main"
      ];
      "git.branchRandomName.enable" = true;
      "git.fetchOnPull" = true;
      "git.mergeEditor" = true;

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
      "workbench.colorTheme" = "GitHub Dark Default";
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "cofob";
    userEmail = "cofob@riseup.net";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "codium --wait";
      user.signingkey = "5F3D9D3DECE08651DE14D29FACAD4265E193794D";
      commit.gpgsign = true;
      tag.gpgsign = true;
      url = {
        "git@github.com:" = {
          insteadOf = [
            "gh:"
            "github:"
          ];
        };
        "git@codeberg.org:" = {
          insteadOf = [
            "cb:"
            "codeberg:"
          ];
        };
        "git@git.sr.ht:" = {
          insteadOf = [
            "sh:"
            "srht:"
            "sourcehut:"
          ];
        };
        "git@git.averyan.ru:" = {
          insteadOf = [
            "git:"
            "averyan:"
            "firesquare:"
            "frsqr:"
          ];
        };
      };
    };
  };
}
