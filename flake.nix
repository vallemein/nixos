{
  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, agenix, home-manager }:
    {
      nixosConfigurations = {
        bear = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./bear.nix
            agenix.nixosModule
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.cofob = import ./home/bear.nix;
            }
          ];
        };
      };
    };
}
