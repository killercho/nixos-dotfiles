{ pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  environment.systemPackages = with pkgs; [
    microcodeAmd
  ];

  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
  ];
}
