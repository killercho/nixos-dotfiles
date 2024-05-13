# User zsh config
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    zplug
  ];

  programs.zsh = {

    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    dotDir = ".config/zsh";

    initExtra = ''
      # Enable to use wal colors from the cache
      #cat $HOME/.cache/wal/sequences

      bindkey '' insert-cycledleft
      bindkey '' insert-cycledright
    '';

    envExtra = ''
      export PATH="$PATH:$HOME/.local/bin"
    '';

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "sudo" "dircycle" ];
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "hlissner/zsh-autopair"; }
      ];
    };
  };
}
