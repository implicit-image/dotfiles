{ config, pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    protontricks = {
      enable = true;
    };
  };
}
