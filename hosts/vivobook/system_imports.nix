{ ... }:

{
  imports = [
    # Hardware configuration for the laptop
    ./../../machines/vivobook/hardware-configuration.nix

    # Configuration.nix split into two files
    ./../../modules/system/system_settings.nix
    ./../../modules/system/system_packages.nix

    # Hyperland enable and default setup
    ./../../modules/system/hyprland.nix

    # Stylix enable and global settings
    ./../../modules/system/stylix.nix

    # OpenVPN configurations
    ./../../modules/system/openvpn.nix

    # Global temporary packages and settings
    ./../../modules/system/temp.nix

    # Gaming related system packages
    #./../../modules/system/gaming.nix
  ];
}
