{ config, lib, pkgs, ... }:

{
  home.file."picom.conf" = {
    target = ".config/picom/picom.conf";
    source = "${config.home.sessionVariables.DOTFILES}/picom/picom-light.conf";
  };
}
