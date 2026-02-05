{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lutris
    heroic
    gamescope
    oversteer
    protonup-ng
    #wine64
    wineWow64Packages.full
    winetricks
    protontricks
  ];

  programs = {
    steam.enable = true;
  };

  hardware.new-lg4ff.enable = true;

  services.udev.packages = with pkgs; [ oversteer ];
}
