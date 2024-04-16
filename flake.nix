{

  description = "Main system flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{self, nixpkgs, nixpkgs-unstable, home-manager, stylix, ...}:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    overlay-unstable = final: prev: {
      unstable = nixpkgs-unstable.legacyPackages.${prev.system};
    };

  in {

    nixosConfigurations = {

      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./X11/system/configuration.nix
        ];
      };

      wayland = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./wayland/system/configuration.nix

          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.AzSamSi = import ./wayland/user/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; }; # allows access to flake inputs in hm modules
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };

    };

    #homeConfigurations = {
      #AzSamSi = home-manager.lib.homeManagerConfiguration {
        #inherit pkgs;
        #modules = [
          #./X11/user/home.nix
        #];
      #};
      #wayland = home-manager.lib.homeManagerConfiguration {
        #inherit pkgs;
        #modules = [
          #({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          #./wayland/user/home.nix
        #];
      #};
    #};

  };
}
