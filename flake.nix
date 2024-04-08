{

  description = "Main system flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, ...}:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
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
          ./wayland/user/home.nix
        ];
      };

    };

  };
}
