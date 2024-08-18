# User defined modules for waybar
{ lib, pkgs, config, ... }:

{
  home.file.".config/waybar/waybar-modules.json".text = ''
    {
    "clock" : {
      "interval" : 1,
      "format" : "{:%H:%M }󰥔",
      "timezone" : "Europe/Sofia",
      "tooltip-format" : "<big>{:%Y %B %D}</big> <tt><small>{calendar}</small></tt>"
    },

    "battery" : {
      "states" : {
          "good" : 95,
          "warning" : 30,
          "critical" : 15
      },
      "format" : "{capacity}% {icon} ",
      "format-charging" : "{capacity}% ",
      "format-plugged" : "{capacity}% ",
      "format-icons" : [ "","","","","" ]
    },

    "hyprland/language" : {
      "format" : "Lang: {}",
      "format-en" : "EN",
      "format-bg" : "BG",
      "keyboard-name" : "at-translated-set-2-keyboard"
    },

    "custom/language" : {
      "format" : "Lang: {}",
      "exec" : "${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} devices -j | ${lib.getExe pkgs.jq} -r '.keyboards[] | select(.main==true).active_keymap'  | sed 's/ .*$//;s/Bulgarian/BG/;s/English/EN/'",
      "restart-interval" : 1
    },

    "hyprland/workspaces" : {
      "format" : "{icon}",
      "format-icons" : {
          "active" : "",
          "default" : ""
      },
      "on-click" : "activate",
      "on-scroll-up" : "hyprctl dispatch workspace e+1",
      "on-scroll-down" : "hyprctl dispatch workspace e-1",
      "active-only" : false
    },

    "tray" : {
      "icon-size" : 18,
      "spacing" : 12
    },

    "memory" : { "format" : "{}% " },

    "backlight" : {
      "format" : "{percent}% {icon}",
      "format-icons" : [ "","","","","","","","","" ]
    },

    "pulseaudio" : {
      "scroll-step" : 1,
      "format" : "{volume}% {icon} {format_source}",
      "format-bluetooth" : "{volume}% {icon}  {format_source}",
      "format-bluetooth-muted" : "{volume}% 󰸈 {icon}  {format_source}",
      "format-muted" : " {volume}% 󰸈 {format_source} ",
      "format-source" : "  ",
      "format-source-muted" : "  ",
      "format-icons" : {
          "headphone" : "",
          "hands-free" : "",
          "headset" : "",
          "phone" : "",
          "portable" : "",
          "car" : "",
          "default" : [ "","","" ]
      }
    }
    }
  '';
}
