{ pkgs, piper-git-nix, ... }:

let
  libratbag-git = piper-git-nix.packages.${pkgs.stdenv.hostPlatform.system}.libratbag-git;
  piper-git = piper-git-nix.packages.${pkgs.stdenv.hostPlatform.system}.piper-git;
in
{
  environment.systemPackages = with pkgs; [
    lutris
    heroic
    gamescope
    oversteer
    protonup-ng
    wineWow64Packages.full
    winetricks
    protontricks

    piper-git
  ];

  programs = {
    steam.enable = true;
    solaar = {
      enable = true;
      userService.enable = true;
    };
  };

  hardware.logitech.wireless = {
    enable = true;
  };

  services.ratbagd = {
    enable = true;
    package = libratbag-git;
  };
  services.udev.packages = with pkgs; [ oversteer ];

  # Disabled for compatability with kernel 7.3.
  # Disabled on 21/10/2026.
  # hardware.new-lg4ff.enable = true;
}
