# User notifications config
{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    dunst
  ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "10x20";
        origin = "top-right";
        transparency = 10;
        timeout = lib.mkDefault 3;
        frame_color = "#eceff1";
        font = lib.mkDefault "Droid Sans 9";
      };

      urgency_normal = {
        background = lib.mkDefault "#37474f";
        foreground = lib.mkDefault "#eceff1";
        timeout = lib.mkDefault 4;
      };

    };
  };
}
