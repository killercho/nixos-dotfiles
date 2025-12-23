{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Package for controlling the ups
    nut
  ];
}
