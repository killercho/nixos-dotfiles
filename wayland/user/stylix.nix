# User stylix config
{ config, pkgs, stylix, ... }:

{
  stylix = {
    autoEnable = true;
    image = /usr/share/backgrounds/background.jpg;
    polarity = "dark";

    cursor = {
      size = 16;
    };

    opacity = {
      applications = 0.9;
      terminal = 0.7;
      popups = 0.4;
      desktop = 0.9;
    };

    fonts = {
      sizes = {
        terminal = 11;
        desktop = 9;
      };
    };

  };
}
