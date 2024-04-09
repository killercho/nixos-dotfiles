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
    #regreet.enable = true;
  };

  security.pam.services.swaylock = {};

  # Configure xwayland
  services.xserver = {
    enable = true;
    #xkb = {
      #layout = "us,bg";
      #variant = ",phonetic";
      #options = "grp:alt_shift_toggle";
    #};
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      theme = "chili";
    };
  };

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
    sddm
    swaylock
    swayidle

    (sddm-chili-theme.override {
      themeConfig = {
        background = "/usr/share/backgrounds/background.jpg";
        blur = true;
        recursiveBlurLoops = 3;
        recursiveBlurRadius = 5;
      };})
    ];
  }

