{

  description = "Main system flake";

  inputs = {
    nixpkgs-23-11.url = "nixpkgs/nixos-23.11";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = {self, nixpkgs, nixpkgs-23-11, home-manager, stylix, ...}:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    overlay-old = final: prev: {
      old-23-11 = nixpkgs-23-11.legacyPackages.${prev.system};
    };

  in {

    nixosConfigurations = {

      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./X11/system/configuration.nix
        ];
      };

      wayland = lib.nixosSystem {
        inherit system;
        modules = [
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager

          ./wayland/system/configuration.nix
        ];
      };

    };

    homeConfigurations = {

      AzSamSi = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./X11/user/home.nix
        ];
      };

      wayland = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          stylix.homeManagerModules.stylix

          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-old ]; })

          ./wayland/user/home.nix
        ];
      };

    };

  };
}
