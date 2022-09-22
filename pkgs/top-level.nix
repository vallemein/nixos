{ pkgs, ... }:

{
  ultimmc = pkgs.callPackage ./games/ultimmc { };
  deta = pkgs.callPackage ./deta.nix { };
}
