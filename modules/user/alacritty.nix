# User alacritty config
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font.size = lib.mkDefault 10;
      font.normal.family = lib.mkDefault "JetBrains Mono";
      font.normal.style = lib.mkDefault "Regular";
      mouse.hide_when_typing = true;
      window.opacity = lib.mkDefault 0.9;
    };
  };
}
