{ pkgs, ... }:
{
  home.packages = with pkgs; [
  ];

  services.openvpn = {
    servers = {
      home_server_vpn = {
        config = '' config /usr/share/openvpn/home_server_vpn.ovpn '';
        up = "echo Home server vpn running";
        down = "echo Home server vpn not running";
        autoStart = false;
      };
    };
  };
}
