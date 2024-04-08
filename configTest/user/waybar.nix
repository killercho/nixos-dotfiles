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

        modules-left = [];
        modules-center = [];
        modules-right = [ "clock" ];

        clock = {
          "interval" = 1;
          "format" = "{:%a %I:%M:%S :%p}";
          "timezone" = "Europe/Sofia";
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
