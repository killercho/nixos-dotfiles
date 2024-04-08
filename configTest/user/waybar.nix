# User waybar config
{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
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
