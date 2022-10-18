{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt
    rnix-lsp
    lapce
    lldb
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-ru
      github.github-vscode-theme
      shardulm94.trailing-spaces
      yzhang.markdown-all-in-one
      bradlc.vscode-tailwindcss
      editorconfig.editorconfig
      WakaTime.vscode-wakatime
      ms-python.vscode-pylance
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      wix.vscode-import-cost
      matklad.rust-analyzer
      svelte.svelte-vscode
      vadimcn.vscode-lldb
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
        name = "discord-vscode";
        publisher = "icrawl";
        version = "5.8.0";
        sha256 = "IU/looiu6tluAp8u6MeSNCd7B8SSMZ6CEZ64mMsTNmU=";
      }
      {
        name = "vscode-translation";
        publisher = "caiqichang";
        version = "2.0.4";
        sha256 = "AAVAojtqe3QL2oOcWP1Y6nuPDAXgECItLIQhvqfLtvU=";
      }
      {
        name = "copilot";
        publisher = "GitHub";
        version = "1.53.7011";
        sha256 = "eNYT+f6hyLpWcbqHjh+2+NSnL2zfJ4vB41yXfaiR7as=";
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
