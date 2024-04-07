# User zsh config
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
  ];

  programs.zsh = {

    enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      cat $HOME/.cache/wal/sequences
    '';

    envExtra = ''
      export PATH="$PATH:$HOME/.local/bin"
    '';

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
