# User zsh config
{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    zsh
    zplug
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    dotDir = "${config.home.homeDirectory}/zsh";

    initContent = ''
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
      "nix-update-wayland" = "nix flake update --flake ~/nixos-dotfiles &&
                              echo 'Starting the system rebuild' &&
                              sudo nixos-rebuild switch --flake ~/nixos-dotfiles#wayland --impure &&
                              echo 'Starting the home rebuild' &&
                              home-manager switch --flake ~/nixos-dotfiles#wayland --impure &&
                              cd ~/nixos-dotfiles &&
                              git add . &&
                              git commit -m \"Updated system \" &&
                              git push";

      "nix-update-desktop" = "nix flake update --flake ~/nixos-dotfiles &&
                              echo 'Starting the system rebuild' &&
                              sudo nixos-rebuild switch --flake ~/nixos-dotfiles#desktop --impure &&
                              echo 'Starting the home rebuild' &&
                              home-manager switch --flake ~/nixos-dotfiles#desktop --impure &&
                              cd ~/nixos-dotfiles &&
                              git add . &&
                              git commit -m \"Updated system \" &&
                              git push";
    };
  };
}
