# User zsh config
{ pkgs, ... }:

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

    shellAliases = {
      "nix-update-wayland" = "nix flake update ~/nixos-dotfiles &&
                              sudo nixos-rebuild switch --flake ~/nixos-dotfiles#wayland &&
                              home-manager switch --flake ~/nixos-dotfiles#wayland &&
                              cd ~/nixos-dotfiles &&
                              git add . &&
                              git commit -m \"Updated system \" &&
                              git push";
    };
  };
}
