{ lib, pkgs, ... }:

{
  services.xserver.enable = true;
  # You may need to comment out "services.displayManager.gdm.enable = true;"
  #services.xserver.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
  services.xserver.displayManager.defaultSession = "plasma";
  # or
  # services.xserver.desktopManager.plasma5.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
    kate
    elisa
    ark
  ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
