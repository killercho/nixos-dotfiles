# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar.enable = true;
    regreet.enable = true;
  };

  #services.greetd = {
    #enable = true;
    #package = pkgs.greetd.regreet;
    #settings = {
      #default_session = {
        #command = "Hyprland";
        #user = "AzSamSi";
      #};
    #};
  #};

  #Screen share enable
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    hyprland
    swww # for wallpapers
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xwayland
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    rofi-wayland rofi-bluetooth
    waybar
    meson
    greetd.regreet
    cage
  ];
}

