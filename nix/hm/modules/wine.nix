{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWowPackages.stagingFull
    winetricks
    lutris
  ];
}
