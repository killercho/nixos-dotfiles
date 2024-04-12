# User waybar config
{ config, pkgs, stylix, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 25;
        margin = "7 7 3 7";
        spacing = 2;

        modules-left = [ "battery" "idle_inhibitor" ];
        modules-center = [ "hyprland/workspaces" "tray" ];
        modules-right = [ "pulseaudio" "backlight" "hyprland/language" "clock" ];

        clock = {
          "interval" = 1;
          "format" = "{: %H:%M 󰥔}";
          "timezone" = "Europe/Sofia";
          "tooltip-format" = ''
            <big>{:%Y %B %D}</big>
            <tt><small>{calendar}</small></tt>
          '';
        };

        battery = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% ";
          "format-plugged" = "{capacity}% ";
          #"format-good" = ""; # An empty format will hide the module
          #"format-full" = "";
          "format-icons" = [ "" "" "" "" "" ];
        };

        "hyprland/language" = {
          "format" = "Lang: {}";
          "format-en" = "EN";
          "format-bg" = "BG";
          "keyboard-name" = "at-translated-set-2-keyboard";
        };

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "1" = "󱚌";
            "2" = "󰖟";
            "3" = "";
            "4" = "󰎄";
            "5" = "󰋩";
            "6" = "";
            "7" = "󰄖";
            "8" = "󰑴";
            "9" = "󱎓";
          };
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "active-only" = false;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰅶";
            deactivated = "󰾪";
          };
        };

        tray = {
          #"icon-size" = 21;
          "spacing" = 10;
        };

        memory = { "format" = "{}% "; };

        backlight = {
          "format" = "{percent}% {icon}";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
        };

        pulseaudio = {
          "scroll-step" = 1;
          "format" = "{volume}% {icon}  {format_source}";
          "format-bluetooth" = "{volume}% {icon}  {format_source}";
          "format-bluetooth-muted" = "󰸈 {icon}  {format_source}";
          "format-muted" = "󰸈 {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = " ";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          #"on-click" = "pypr toggle pavucontrol && hyprctl dispatch bringactivetotop";
        };
      };
    };
  };

  # If the waybar is not displaying the workspaces
  #nixpkgs.overlays = [
    #(self: super: {
      #waybar = super.waybar.overrideAttrs (oldAttrs: {
        #mesonFlag = oldAttrs.mesonFlags ++ [ "-Dexperimental=true"];
      #});
    #})
  #];
}
