{ config, lib, pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = "Material-Black-Mango-3.38";
    iconTheme = "Vimix White";
    cursorTheme = "Vimix Cursors";
    font = "FantasqueSansM Nerd Font Mono";
  };
  qt = {
    enable = true;
    style.name = "kvantum";
  };
}
