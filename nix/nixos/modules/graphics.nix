{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    vulkan-tools
    vulkan-loader
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-ocl
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
    ];
  }
}
