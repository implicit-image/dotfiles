{ config, pkgs, lem-overlay, ... }:
{
  home.packages = [ pkgs.lem-ncurses pkgs.lem-sdl2 ];
}
