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
      applications = 0.8;
      terminal = 0.7;
    };

    fonts = {
      sizes = {
        terminal = 11;
        desktop = 9;
      };
    };

  };
}
