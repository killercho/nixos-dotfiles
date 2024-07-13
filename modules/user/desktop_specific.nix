{ pkgs, ... }:
{
  home.packages = with pkgs; [
  ];

  programs.mangohud.enable = true;
}
