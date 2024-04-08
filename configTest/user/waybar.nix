# User waybar config
{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 35;
        margin = "7 7 3 7";
        spacing = 2;

        modules-left = [ "battery" ];
        modules-center = [];
        modules-right = [ "clock" ];

        clock = {
          "interval" = 1;
          "format" = "{:%a %I:%M:%S :%p}";
          "timezone" = "Europe/Sofia";
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
