# User zsh config
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
  ];

  #home.file.".zshrc".text = ''
    #cat $HOME/.cache/wal/sequences
  #''

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    zplug = {
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "sudo" ];
    };
  };
}
