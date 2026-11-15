# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ lib, pkgs, ... }:

{
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar.enable = true;

    silentSDDM = {
      enable = true;
      theme = "default";
    };
  };

  services = {
    xserver.enable = true;

    displayManager.sddm = {
      enable = true;
      theme = "silent";
    };

    # Screen share enable
    dbus = {
      enable = true;
      packages = [
        pkgs.libnotify
      ];
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = lib.mkForce true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    hyprland
    awww # for wallpapers
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xwayland
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    fuzzel
    waybar
    meson
  ];
}
