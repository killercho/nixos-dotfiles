# Configuration for all unrelated things to development
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zip
    unzip
    cargo
    python3
    ripgrep
    nixd
    nixpkgs-fmt
    libclang
    ltex-ls
    gdb

    raylib
  ];

  programs.ripgrep.enable = true;
}
