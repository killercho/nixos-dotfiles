# User git config
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Georgi Nikolov";
      user.email = "ggeorgi60@gmail.com";
      core.editor = "nvim";
    };
  };
}
