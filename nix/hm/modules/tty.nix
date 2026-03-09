{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wget
    banner
    figlet
    inetutils
  ];
}
