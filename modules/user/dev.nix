# Configuration for all unrelated things to development
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zip
    unzip
    cargo
    python3
    black
    ripgrep
    nixd
    nixpkgs-fmt
    libclang
    ltex-ls
    gdb
    cmake
    gnumake

    pixelorama
  ];

  programs.ripgrep.enable = true;
}
