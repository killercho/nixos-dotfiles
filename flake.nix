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

            # Hardware configuration for the laptop
            ./machines/vivobook/hardware-configuration.nix

            # Configuration.nix split into two files
            ./modules/system/system_settings.nix
            ./modules/system/system_packages.nix

            # Hyperland enable and default setup
            ./modules/system/hyprland.nix

            # Stylix enable and global settings
            ./modules/system/stylix.nix

            # Global temporary packages and settings
            ./modules/system/temp.nix
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

            # Home.nix split up into two files
            ./modules/user/home_settings.nix
            ./modules/user/user_packages.nix

            # User shell configuration
            ./modules/user/zsh.nix

            # User git configuration
            ./modules/user/git.nix

            # User terminal configuration
            ./modules/user/alacritty.nix

            # User app launcher configuration
            ./modules/user/fuzzel.nix

            # User neovim configuration
            ./modules/user/neovim/neovim.nix

            # Development needed tools
            ./modules/user/dev.nix

            # User stylix configuration
            ./modules/user/stylix.nix

            # User hyprland configuration
            ./modules/user/hyprland/hyprland.nix

            # Notification popups configuration
            ./modules/user/notifications.nix

            # User waybar configuration
            ./modules/user/waybar/waybar.nix
            ./modules/user/waybar/waybar-modules.nix
            ./modules/user/waybar/waybar-style.nix

            # Volume popup script
            ./scripts/volume.nix

            # Battery low warning
            ./scripts/battery_notifier.nix
          ];
        };

      };

    };
}
