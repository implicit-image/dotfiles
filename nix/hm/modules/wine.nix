{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWowPackages.full
    zenity
    winetricks
  ];

  programs = {
    lutris = {
      enable = true;
      extraPackages = with pkgs; [
        mangohud
        gamescope
        umu-launcher
      ];
      protonPackages = with pkgs; [
        proton-ge-bin
      ];
      winePackages = with pkgs; [
        wineWowPackages.stagingFull
        wineWowPackages.full
      ];
    };
  };
}
