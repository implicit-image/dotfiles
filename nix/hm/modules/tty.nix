{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wget
    inetutils
  ];
}
