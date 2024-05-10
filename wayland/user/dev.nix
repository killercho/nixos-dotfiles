# Configuration for all unrelated things to development
{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        clang-tools
    ];
}
