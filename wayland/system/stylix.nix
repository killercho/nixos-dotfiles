# User stylix config
{ config, pkgs, stylix, ... }:

{
  imports = [ stylix.nixosModules.stylix ];

  stylix = {
    image = /usr/share/backgrounds/background.jpg;
    polarity = "dark";
  };
}