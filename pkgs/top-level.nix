{ pkgs, ... }:

{
  ultimmc = pkgs.callPackage ./games/ultimmc.nix { inherit pkgs; };
}
