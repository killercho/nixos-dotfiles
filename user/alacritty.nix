# User zsh config
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];

  programs.alacritty.settings = {

    env.TERM = "xterm-256color";

    font.size = 9;
    font.normal.family = "JetBrains Mono";
    font.normal.style = "Regular";

    mouse.hide_when_typing = true;

    window.opacity = 0.7;

  };

}
