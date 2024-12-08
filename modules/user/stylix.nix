# User stylix config
{ ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    image = /usr/share/backgrounds/background.jpg;
    polarity = "dark";

    targets = {
      fuzzel.enable = false;
      neovim.enable = false;
      hyprland.enable = false;
    };

    cursor = {
      size = 12;
    };

    opacity = {
      applications = 0.8;
      terminal = 0.7;
      popups = 0.4;
      desktop = 0.8;
    };

    fonts = {
      sizes = {
        terminal = 11;
        desktop = 9;
        applications = 12;
        popups = 10;
      };
    };

  };
}
