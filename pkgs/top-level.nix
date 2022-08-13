{ pkgs, ... }:

{
  ultimmc = pkgs.callPackage ./games/ultimmc { inherit pkgs; };
}
