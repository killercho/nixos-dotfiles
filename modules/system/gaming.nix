{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lutris
    gamescope
  ];

  programs = {
    steam.enable = true;
  };
}
