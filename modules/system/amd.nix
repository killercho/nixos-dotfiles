{ pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  environment.systemPackages = with pkgs; [
    microcode-amd
    lact
  ];

  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
