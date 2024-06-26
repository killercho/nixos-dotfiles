# User git config
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Georgi Nikolov";
    userEmail = "ggeorgi60@gmail.com";

    extraConfig = {
      core.editor = "nvim";
    };
  };
}
