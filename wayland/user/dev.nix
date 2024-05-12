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
    clang-tools
  ];

  programs.ripgrep.enable = true;
}
