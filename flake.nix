{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-unstable";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, nur, sops-nix, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
      inherit system;
      config = {
        allowUnfreePredicate = _: true;
      };
    };
  in {

    nixosConfigurations.yahal = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs nur; };
      modules = [
        ./configuration.nix 
        sops-nix.nixosModules.sops
      ];
    };

    homeConfigurations.yahal = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
      	./home/home.nix
        nixvim.homeModules.nixvim
        nur.modules.homeManager.default
      ];
    };
  };
}
