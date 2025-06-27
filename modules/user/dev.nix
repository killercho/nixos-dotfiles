# Configuration for all unrelated things to development
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unzip
    cargo
    #python3
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

  programs.ranger = {
    enable = true;
    rifle = [ ];
    mappings = {
      f = "console fzf_filter%space";
    };
    aliases = { };
    plugins = [
      {
        name = "ranger-fzf-filter";
        src = builtins.fetchGit {
          url = "https://github.com/MuXiu1997/ranger-fzf-filter.git";
          rev = "bf16de2e4ace415b685ff7c58306d0c5146f9f43";
        };
      }
    ];
    settings = {
      column_ratios = "2,3,2";
      show_hidden = true;
    };
    extraConfig = "";
  };
}
