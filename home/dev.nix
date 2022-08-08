{ config, pkgs, lib, ... }:

{
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
            "firesquare:"
            "averyan:"
            "frsqr:"
            "git:"
          ];
        };
      };
    };
  };
}
