# Configuration for all unrelated things to development
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unzip
    cargo
    python3
    ripgrep
    nixd
    nixpkgs-fmt
    libclang
    ltex-ls
    gdb
  ];

  programs.ripgrep.enable = true;
}
