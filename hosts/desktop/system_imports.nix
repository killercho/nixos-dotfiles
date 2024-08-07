{ ... }:

{
  imports = [
    # Hardware configuration for the laptop
    ./../../machines/desktop/hardware-configuration.nix

    # Configuration.nix split into two files
    ./../../modules/system/system_settings.nix
    ./../../modules/system/system_packages.nix

    # Hyperland enable and default setup
    ./../../modules/system/hyprland.nix

    # KDE enable and default setup
    #./../../modules/system/kde.nix

    # Stylix enable and global settings
    ./../../modules/system/stylix.nix

    # Global temporary packages and settings
    ./../../modules/system/temp.nix

    # Amd settings and packages
    ./../../modules/system/amd.nix

    # Gaming related system packages
    ./../../modules/system/gaming.nix
  ];
}
