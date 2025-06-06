{

  description = "Main system flake";

  inputs = {
    nixpkgs-23-11.url = "nixpkgs/nixos-23.11";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, nixpkgs-23-11, home-manager, stylix, ... }:

    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlay-old = final: prev: {
        old-23-11 = nixpkgs-23-11.legacyPackages.${prev.system};
      };
    in
    {
      nixosConfigurations = {
        wayland = lib.nixosSystem {
          inherit system;
          modules = [
            stylix.nixosModules.stylix
            ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-old ]; })
            home-manager.nixosModules.home-manager
            ./hosts/vivobook/system_imports.nix
          ];
        };

        desktop = lib.nixosSystem {
          inherit system;
          modules = [
            stylix.nixosModules.stylix
            ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-old ]; })
            home-manager.nixosModules.home-manager
            ./hosts/desktop/system_imports.nix
          ];
        };
      };

      homeConfigurations = {
        wayland = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            stylix.homeModules.stylix
            ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-old ]; })
            ./hosts/vivobook/user_imports.nix
          ];
        };

        desktop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            stylix.homeModules.stylix
            ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-old ]; })
            ./hosts/desktop/user_imports.nix
          ];
        };

        neovim = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-old ]; })
            ./hosts/neovim/neovim.nix
          ];
        };
      };
    };
}
