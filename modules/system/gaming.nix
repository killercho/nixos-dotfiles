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

  # Disabled for compatability with kernel 7.3.
  # Disabled on 21/10/2026.
  # hardware.new-lg4ff.enable = true;

  services.udev.packages = with pkgs; [ oversteer ];
  services.ratbagd.enable = true;
}
