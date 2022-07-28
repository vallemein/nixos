{
  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, agenix }:
    {
      nixosConfigurations = {
        personal = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./personal.nix
            agenix.nixosModule
          ];
        };
      };
    };
}
