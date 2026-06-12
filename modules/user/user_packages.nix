# Packages for user config
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    spotify
    # Disabled because of an electron 39 compatability issue
    #bitwarden-desktop
    discord
    telegram-desktop
    viber
    vlc
    qbittorrent
    acpi
    teamspeak6-client
  ];
}
