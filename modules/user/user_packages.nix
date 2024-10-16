# Packages for user config
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    spotify
    bitwarden
    webcord
    signal-desktop
    telegram-desktop
    vlc
    qbittorrent
    acpi
  ];
}
