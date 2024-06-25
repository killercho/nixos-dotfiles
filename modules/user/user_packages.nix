# Packages for user config
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    spotify
    bitwarden
    discord
    signal-desktop
    telegram-desktop
    vlc
    qbittorrent-qt5
    acpi
  ];
}
