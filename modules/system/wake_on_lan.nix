{ ... }:

{
  networking = {
    interfaces.enp7s0.wakeOnLan = {
      enable = true;
      policy = [ "magic" ];
    };
    firewall = {
      allowedUDPPorts = [ 9 ];
    };
  };
}
