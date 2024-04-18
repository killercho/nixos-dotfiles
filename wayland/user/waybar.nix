# User waybar config
{ config, pkgs, stylix, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        margin = "7 7 3 7";
        spacing = 4;
        reload_style_on_change = true;

        include = [ "~/.config/waybar/waybar-modules.json" ];

        modules-left = [ "battery" "backlight" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "pulseaudio" "hyprland/language" "tray" "clock" ];

        #clock = {
          #"interval" = 1;
          #"format" = "{:%H:%M }󰥔";
          #"timezone" = "Europe/Sofia";
          #"tooltip-format" = ''
            #<big>{:%Y %B %D}</big>
            #<tt><small>{calendar}</small></tt>
          #'';
        #};

        #battery = {
          #"states" = {
            #"good" = 95;
            #"warning" = 30;
            #"critical" = 15;
          #};
          #"format" = "{capacity}% {icon}";
          #"format-charging" = "{capacity}% ";
          #"format-plugged" = "{capacity}% ";
          ##"format-good" = ""; # An empty format will hide the module
          ##"format-full" = "";
          #"format-icons" = [ "" "" "" "" "" ];
        #};

        #"hyprland/language" = {
          #"format" = "Lang: {}";
          #"format-en" = "EN";
          #"format-bg" = "BG";
          #"keyboard-name" = "at-translated-set-2-keyboard";
        #};

        #"hyprland/workspaces" = {
          #"format" = "{icon}";
          #"format-icons" = {
            ##"1" = "󱚌";
            ##"2" = "󰖟";
            ##"3" = "";
            ##"4" = "󰎄";
            ##"5" = "󰋩";
            ##"6" = "";
            ##"7" = "󰄖";
            ##"8" = "󰑴";
            ##"9" = "󱎓";
            #"active" = "";
            #"default" = "";
          #};
          #"on-click" = "activate";
          #"on-scroll-up" = "hyprctl dispatch workspace e+1";
          #"on-scroll-down" = "hyprctl dispatch workspace e-1";
          #"active-only" = false;
        #};

        #tray = {
          ##"icon-size" = 21;
          #"spacing" = 20;
        #};

        #memory = { "format" = "{}% "; };

        #backlight = {
          #"format" = "{percent}% {icon}";
          #"format-icons" = [ "" "" "" "" "" "" "" "" "" ];
        #};

        #pulseaudio = {
          #"scroll-step" = 1;
          #"format" = "{volume}% {icon}  {format_source}";
          #"format-bluetooth" = "{volume}% {icon}  {format_source}";
          #"format-bluetooth-muted" = "󰸈 {icon}  {format_source}";
          #"format-muted" = "󰸈 {format_source}";
          #"format-source" = "{volume}% ";
          #"format-source-muted" = " ";
          #"format-icons" = {
            #"headphone" = "";
            #"hands-free" = "";
            #"headset" = "";
            #"phone" = "";
            #"portable" = "";
            #"car" = "";
            #"default" = [ "" "" "" ];
          #};
          ##"on-click" = "pypr toggle pavucontrol && hyprctl dispatch bringactivetotop";
        #};
      };
    };
    style = ''
        window#waybar {
          background-color: #'' + config.lib.stylix.colors.base00 + '';
            opacity: 0.85;
            border-radius: 12px;
            color: #'' + config.lib.stylix.colors.base07 + '';
              transition-property: background-color;
              transition-duration: .2s;
              }

            '';
          };
        }
