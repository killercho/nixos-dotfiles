# User waybar config
{ config, pkgs, stylix, ... }:

{
  imports = [
    ./waybar-modules.nix
    ./waybar-style.nix
  ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        margin = "7 7 3 7";
        spacing = 6;
        reload_style_on_change = true;

        include = [ "~/.config/waybar/waybar-modules.json" ];

        modules-left = [ "battery" "backlight" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "pulseaudio" "hyprland/language" "tray" "clock" ];

      };
    };
  };
}
