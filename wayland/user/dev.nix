# Configuration for all unrelated things to development
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    nixd
    nixpkgs-fmt
    clang-tools
  ];

  programs.ripgrep.enable = true;
}
