# Packages for user config
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    spotify
    bitwarden-desktop
    discord
    telegram-desktop
    viber
    vlc
    qbittorrent
    acpi
    teamspeak6-client
  ];
}
