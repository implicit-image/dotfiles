{ config, lib, pkgs, ... }:

{
  home.file."dunstrc" = {
    target = ".config/dunst/dunstrc";
    source = "${config.home.sessionVariables.DOTFILES}/dunst/dunstrc";
  };
}
