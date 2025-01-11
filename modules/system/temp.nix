# This is a module configuring all the things that are in the configuration temporarily
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    apacheHttpd
  ];

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  services.httpd = {
    enable = true;
    enablePHP = true;
    user = "AzSamSi";

    virtualHosts = {
      web-project = {
        hostName = "web-project.local";
        listen = [{ port = 80; }];
        documentRoot = "/home/AzSamSi/Programming/Web/nowayforward_human/";
      };
    };
  };

  networking.extraHosts = ''
    127.0.0.1 web-project.local
  '';
}
