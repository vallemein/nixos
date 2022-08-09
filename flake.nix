{
  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = github:nix-community/NUR;

    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nur, agenix, home-manager }:
    {
      nixosModules = {
        home-headless = import ./home/common.nix;
      };
      nixosConfigurations = {
        bear = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./bear.nix
            home-manager.nixosModules.home-manager
            nur.nixosModules.nur
            agenix.nixosModule
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.cofob = import ./home/bear.nix;
            }
            ({ config, pkgs, ... }:
              let
                overlay-unstable = final: prev: {
                  unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
                };
              in
              {
                nixpkgs.overlays = [ overlay-unstable ];
              }
            )
            {
              nixpkgs.overlays = [ nur.overlay ];
            }
          ];
        };
        
        fly = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./fly.nix
            home-manager.nixosModules.home-manager
            nur.nixosModules.nur
            agenix.nixosModule
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.cofob = import ./home/fly.nix;
            }
            ({ config, pkgs, ... }:
              let
                overlay-unstable = final: prev: {
                  unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
                };
              in
              {
                nixpkgs.overlays = [ overlay-unstable ];
              }
            )
            {
              nixpkgs.overlays = [ nur.overlay ];
            }
          ];
        };
      };
    };
}
