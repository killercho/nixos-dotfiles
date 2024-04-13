# User stylix config
{ config, pkgs, stylix, ... }:

{
  imports = [ stylix.homeManagerModules.stylix ];
  stylix = {
    image = /usr/share/backgrounds/background.jpg;
    targets.bemenu.enable = false;
  };
}
