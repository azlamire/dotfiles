{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tgt = {
      url = "github:FedericoBruzzone/tgt";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

     # https://github.com/nix-community/nixvim
    nixvim.url = "github:nix-community/nixvim";

  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, tgt, nur, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
      inherit system;
      config = {
        allowUnfreePredicate = _: true;
      };
    };
  in {

    nixosConfigurations.juchi = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix 
      ];
    };

    homeConfigurations.juchi = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
      	./home/home.nix
        nixvim.homeManagerModules.nixvim
        nur.modules.homeManager.default
      ];
    };
  };
}