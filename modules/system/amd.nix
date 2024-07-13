{ ... }:
{
	boot.initrd.kernelModules = [ "amdgpu" ];
	services.xserver.enable = true;
	services.xserver.videoDrivers = [ "amdgpu" ];
}
