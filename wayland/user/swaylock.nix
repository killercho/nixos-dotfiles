# User swaylock config
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    swaylock
    swayidle
  ];

  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
    ];
    timeouts = [
      #{ timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      #{ timeout = 600; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };

  programs.swaylock = {
    enable = true;
    settings = {
      #color = "808080";
      image = "/usr/share/backgrounds/background.jpg";
      tiling = true;
      font-size = 24;
      indicator-idle-visible = true;
      indicator-radius = 100;
      line-color = "ffffff";
      show-failed-attempts = true;
    };
  };
}
