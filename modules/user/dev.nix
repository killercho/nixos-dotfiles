# Configuration for all unrelated things to development
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unzip
    cargo
    python3
    python312Packages.requests
    ripgrep
    nixd
    nixpkgs-fmt
    libclang
    ltex-ls
    gh
    tree-sitter
    go
  ];

  programs.ripgrep.enable = true;
}
