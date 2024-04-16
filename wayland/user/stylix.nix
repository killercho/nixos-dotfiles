# User stylix config
{ config, pkgs, stylix, ... }:

{
  #imports = [ stylix.homeManagerModules.stylix ];
  lib.stylix = {
    image = /usr/share/backgrounds/background.jpg;
  };
}
