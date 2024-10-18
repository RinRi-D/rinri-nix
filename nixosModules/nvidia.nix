{ config, libs, pkgs, ... }:

{
  boot.kernelParams = [ "nvidia_drm.modset=1" "nvidia_drm.fbdev=1" ];

# Enable OpenGL
  hardware.opengl = {
    enable = true;
  };

# Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = false;
  hardware.nvidia.powerManagement.finegrained = false;
  hardware.nvidia.open = false;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
