# i3 and X11 Configuration
{ config, lib, pkgs, ... }:

{
  # Enable the X11 windowing system
  services = {
    picom = {
      enable = true;
      backend = "glx";
      opacityRules = [
        "80:class_g = 'Alacritty'"
        "80:class_g = 'Polybar'"
      ];
      shadow = true;
      settings = {
        blur = {
          method = "dual_kawase";
          strength = 12;
          kern = "3x3box";
        };
        blur-background = false;
        blur-background-frame = true;
        blur-background-fixed = true;
        corner-radius = 15;
      };
    };
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      exportConfiguration = true;
      libinput = {
        enable = true;
        touchpad.tapping = true;
        touchpad.naturalScrolling = true;
      };
      displayManager.lightdm.greeters.gtk = {
        enable = true;
        theme.name = "ltheme";
        extraConfig = ''
            user-background = false
        '';
      };
      displayManager.lightdm.background = "/usr/share/backgrounds/background.jpg";
      #displayManager.lightdm.greeter.package = "lightdm-gtk-greeter";
      #displayManager.lightdm.extraSeatDefaults = ''
        #greeter-session=lightdm-gtk-greeter
      #'';
    };
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,bg";
    variant = ",phonetic";
    options = "grp:alt_shift_toggle";
  };

  # Install i3/X11 needed apps
  environment.systemPackages = with pkgs; [
    flameshot
    i3 polybarFull wmctrl picom pywal feh xorg.xprop
    rofi rofi-bluetooth
    lightdm lightlocker lightdm-gtk-greeter
  ];
}

