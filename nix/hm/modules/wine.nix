{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWowPackages.stagingFull
  ];

  programs = {
    lutris = {
      enable = true;
      extraPackages = with pkgs; [
        mangohud
        winetricks
        gamescope
        umu-launcher
        zenity
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
