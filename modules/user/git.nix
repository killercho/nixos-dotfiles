# User git config
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Georgi Nikolov";
      user.email = "ggeorgi60@gmail.com";
      core.editor = "nvim";
      # Cache the username and password for 12 hours.
      # Enough for a single day of work.
      credential.helper = "cache --timeout=43200";
    };
  };
}
