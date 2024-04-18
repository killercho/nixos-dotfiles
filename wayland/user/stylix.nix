# User stylix config
{ config, pkgs, stylix, ... }:

{
  stylix = {
    image = /usr/share/backgrounds/background.jpg;
    polarity = "dark";

    cursor = {
      size = 16;
    };

    opacity = {
      applications = 0.8;
      terminal = 0.7;
    };

  };
}
