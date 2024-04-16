# User stylix config
{ config, pkgs, stylix, ... }:

{
  stylix = {
    image = /usr/share/backgrounds/background.jpg;
    polarity = "dark";
    opacity = {
      applications = 0.8;
      terminal = 0.7;
    };
  };
}
