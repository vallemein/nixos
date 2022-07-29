{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    rnix-lsp
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      serayuzgur.crates
      jnoortheen.nix-ide
      bradlc.vscode-tailwindcss
      editorconfig.editorconfig
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "svelte-vscode";
        publisher = "svelte";
        version = "105.20.0";
        sha256 = "+vYNgKVuknPROKTMMHugc9VrvYZ7GONr5SgYsb7l5rs=";
      }
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
        name = "even-better-toml";
        publisher = "tamasfe";
        version = "0.16.5";
        sha256 = "pRUiXsZGhTIQx2Qx9NFQ7OGRros3KdzjUlq13nm4pAc=";
      }
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1143";
        sha256 = "nRtRSbGVsT47LYY6mdL0v9fvR8inj+benNJUPJdbVEs=";
      }
      {
        name = "direnv";
        publisher = "mkhl";
        version = "0.6.1";
        sha256 = "5/Tqpn/7byl+z2ATflgKV1+rhdqj+XMEZNbGwDmGwLQ=";
      }
    ];
    userSettings = {
      "nix.enableLanguageServer" = true;
      "svelte.enable-ts-plugin" = true;
      "rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";

      "[svelte]"."editor.defaultFormatter" = "svelte.svelte-vscode";

      "editor.quickSuggestions" = {
        "strings" = true;
      };

      "files.autoSave" = "afterDelay";
      "diffEditor.ignoreTrimWhitespace" = false;

      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "git.autofetch" = true;
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
