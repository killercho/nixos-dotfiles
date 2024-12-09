# Clangd configuration for my work machine
{ config, pkgs, ... }:

{
  home.file.".config/clangd/config.yaml".text = ''
    CompileFlags:
      Add: [
        "-I/usr/include/c++/9",
        "-I/usr/include/x86_64-linux-gnu/c++/9",
        "-ferror-limit=0",
      ]
  '';
}
