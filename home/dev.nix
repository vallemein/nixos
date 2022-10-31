{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    github-desktop
    nixpkgs-fmt
    rnix-lsp
    lapce
    lldb
    gh
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      bierner.emojisense
      bradlc.vscode-tailwindcss
      davidanson.vscode-markdownlint
      dbaeumer.vscode-eslint
      editorconfig.editorconfig
      esbenp.prettier-vscode
      formulahendry.auto-rename-tag
      github.github-vscode-theme
      github.vscode-pull-request-github
      golang.go
      jnoortheen.nix-ide
      matklad.rust-analyzer
      mhutchie.git-graph
      ms-ceintl.vscode-language-pack-ru
      ms-python.python
      ms-python.vscode-pylance
      shardulm94.trailing-spaces
      svelte.svelte-vscode
      tyriar.sort-lines
      vadimcn.vscode-lldb
      WakaTime.vscode-wakatime
      wix.vscode-import-cost
      yzhang.markdown-all-in-one
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "todo-tree";
        publisher = "Gruntfuggly";
        version = "0.0.219";
        sha256 = "hV92FSwoIShvoVCxIR4h7qAFAZITE3L1mxNrWkd0y8Y=";
      }
      {
        name = "copilot-nightly";
        publisher = "github";
        version = "1.55.7138";
        sha256 = "5tRhQpca+/OD7ZXvBQXt87E13aCtTn7oNHkI///gr0Q=";
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
      {
        name = "inline-fold";
        publisher = "moalamri";
        version = "0.1.10";
        sha256 = "HTqlY790lS+L6yWfDV27VhLNHu4TMzwVNiP8cNzDTjM=";
      }
    ];
    userSettings = {
      "nix.enableLanguageServer" = true;
      "svelte.enable-ts-plugin" = true;

      # Translations
      "translation.source-language" = "ru";

      # Suggest faster
      "editor.quickSuggestions" = {
        "strings" = true;
      };

      "diffEditor.ignoreTrimWhitespace" = false;
      "files.autoSave" = "afterDelay";

      # Sticky nested
      "editor.stickyScroll.enabled" = true;

      # Set tab size
      "editor.tabSize" = 2;

      # Enable ligatures
      "editor.fontLigatures" = true;

      # Git settings
      "git.enableSmartCommit" = true;
      "git.branchPrefix" = "cofob/";
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
      "prettier.printWidth" = 100;

      # Enable yew html! macro syntax support
      "emmet.includeLanguages" = {
        "rust" = "html";
      };

      # Set editor theme
      "workbench.colorTheme" = "GitHub Dark Dimmed";
      # Disable welcome screen
      "workbench.startupEditor" = "none";

      "debug.openDebug" = "openOnDebugBreak";
      "debug.internalConsoleOptions" = "openOnSessionStart";
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "dart.checkForSdkUpdates" = false;

      "[dart]" = {
        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
        "editor.rulers" = [ 80 ];
        "editor.selectionHighlight" = false;
        "editor.suggest.snippetsPreventQuickSuggestions" = false;
        "editor.suggestSelection" = "first";
        "editor.tabCompletion" = "onlySnippets";
        "editor.wordBasedSuggestions" = false;
      };

      # Python
      "python.linting.mypyEnabled" = true;
      "python.formatting.blackArgs" = [
        "-l100"
        "-tpy310"
      ];
      "python.sortImports.path" = "isort";
      "python.languageServer" = "Pylance";
      "python.formatting.provider" = "black";

      # Copilot
      "editor.inlineSuggest.enabled" = true;
      "github.copilot.enable" = {
        "*" = true;
        "yaml" = true;
        "plaintext" = true;
        "markdown" = true;
      };
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
      push.autoSetupRemote = true;
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
