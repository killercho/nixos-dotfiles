# This is a module configuring all the things that are in the configuration temporarily
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ciscoPacketTracer8
    wireshark
  ];
  programs.wireshark.enable = true;
}
