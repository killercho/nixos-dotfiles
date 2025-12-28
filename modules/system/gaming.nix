{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lutris
    gamescope
    oversteer
    protonup-ng
    wine64
    winetricks
  ];

  programs = {
    steam.enable = true;
  };

  hardware.new-lg4ff.enable = true;

  services.udev.packages = with pkgs; [ oversteer ];
}
