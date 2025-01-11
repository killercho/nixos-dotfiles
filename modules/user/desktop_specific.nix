{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Package for controlling the ups
    nut
  ];

  programs.mangohud = {
    enable = true;
    settings = {
      cpu_temp = true;
      cpu_mhz = true;
      gpu_temp = true;
      ram = true;
    };
  };
}
