# User zsh config
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
  ];

  programs.zsh = {

    enable = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;

    initExtra = ''
      cat $HOME/.cache/wal/sequences
    '';

    envExtra = ''
      export PATH="$PATH:$HOME/.local/bin"
    '';

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "sudo" ];
    };
  };
}
