{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sleep-on-lan
  ];

  networking = {
    interfaces.enp7s0.wakeOnLan = {
      enable = true;
      policy = [ "magic" "arp" ];
    };
    firewall = {
      allowedUDPPorts = [ 9 ];
    };
  };

  systemd.services.sleepOnLanStartup = {
    description = "Start the sleep on lan application to be able to turn off PC.";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/sleep-on-lan --config /etc/sleep-on-lan.json";
      Restart = "no";
    };
  };
}
