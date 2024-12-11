{ ... }:

{
  imports = [
    # Home.nix split up into two files
    ./../../modules/user/home_settings.nix

    # User neovim configuration
    ./../../modules/user/neovim/neovim.nix

    # Development needed tools
    ./../../modules/user/dev.nix

    # Better terminal emulator
    ./../../modules/user/alacritty.nix
  ];
}
