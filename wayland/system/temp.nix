# This is a module configuring all the things that are in the configuration temporarily
{ config, pkgs, ... }:

{
  # MySQL for the Databases course
  services.mysql.enable = true;
  services.mysql.package = pkgs.mysql;

  environment.systemPackages = with pkgs; [
    R rstudio rPackages.rmarkdown
  ];
}
