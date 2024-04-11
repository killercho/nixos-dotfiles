# User swaylock config
{ config, pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [
    hyprlock
    hypridle
  ];

  home.file = {
    "~/.config/hypr/hyprlock.conf".text = ''
    '';

    "~/.config/hypr/hypridle.conf".text = ''
    '';
  };
}
