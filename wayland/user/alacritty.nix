# User zsh config
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  #home.file = {
    ## # Building this configuration will create a copy of 'dotfiles/screenrc' in
    ## # the Nix store. Activating the configuration will then make '~/.screenrc' a
    ## # symlink to the Nix store copy.
    ## ".screenrc".source = dotfiles/screenrc;

    ## # You can also set the file content immediately.
    ## ".gradle/gradle.properties".text = ''
    ##   org.gradle.console=verbose
    ##   org.gradle.daemon.idletimeout=3600000
    ## '';

    #".config/alacritty/alacritty.yaml".text = ''
      #env:
        #TERM: xterm-256color

      #mouse:
        #hide_when_typing: true

      #font:
        #normal:
          #family: JetBrains Mono
          #style: Regular
        #size: 9

      #window:
        #opacity: 0.7
    #'';

    #".config/alacritty/alacritty.toml".text = ''

      #[env]
      #TERM = "xterm-256color"

      #[font]
      #size = 9

      #[font.normal]
      #family = "JetBrains Mono"
      #style = "Regular"

      #[mouse]
      #hide_when_typing = true

      #[window]
      #opacity = 0.7

    #'';
  #};
}
