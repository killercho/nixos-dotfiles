# This is a module configuring all the things that are in the configuration temporarily
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ciscoPacketTracer9
    wireshark
  ];
  programs.wireshark.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "cisco-packet-tracer-9.0.1"
  ];
}
