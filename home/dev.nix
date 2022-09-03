{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt
    rnix-lsp
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscodium;
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
      matklad.rust-analyzer
      svelte.svelte-vscode
      mhutchie.git-graph
      bierner.emojisense
      jnoortheen.nix-ide
      tyriar.sort-lines
      ms-python.python
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
        name = "better-toml";
        publisher = "bungcip";
        version = "0.3.2";
        sha256 = "g+LfgjAnSuSj/nSmlPdB0t29kqTmegZB5B1cYzP8kCI=";
      }
      {
        name = "crates";
        publisher = "serayuzgur";
        version = "0.5.10";
        sha256 = "bY/dphiEPPgTg1zMjvxx4b0Ska2XggRucnZxtbppcLU=";
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

      # Enable yew html! macro syntax support
      "emmet.includeLanguages" = {
        "rust" = "html";
      };

      # Set editor theme
      "workbench.colorTheme" = "GitHub Dark Dimmed";
      # Disable welcome screen
      "workbench.startupEditor" = "none";
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Egor Ternovoy";
    userEmail = "cofob@riseup.net";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "vim";
      user.signingkey = "5F3D9D3DECE08651DE14D29FACAD4265E193794D";
      commit.gpgsign = true;
      tag.gpgsign = true;
      pull.rebase = true;
      url = {
        "git@github.com:" = {
          insteadOf = [
            "gh:"
          ];
        };
        "git@codeberg.org:" = {
          insteadOf = [
            "cb:"
          ];
        };
        "git@git.sr.ht:" = {
          insteadOf = [
            "sh:"
          ];
        };
        "gitea@git.frsqr.xyz:firesquare/" = {
          insteadOf = [
            "fs:"
          ];
        };
        "gitea@git.frsqr.xyz:" = {
          insteadOf = [
            "gitea:"
          ];
        };
      };
    };
  };
}
