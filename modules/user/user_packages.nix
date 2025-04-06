# Packages for user config
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    spotify
    bitwarden
    discord
    teamspeak5_client
    telegram-desktop
    vlc
    qbittorrent
    acpi
  ];
}
