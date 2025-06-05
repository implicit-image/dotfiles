{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    exif
    vimiv-qt
  ];
}
