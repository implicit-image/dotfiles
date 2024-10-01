{ config, lib, pkgs, ... }:

{
  home.file."config" = {
    target = ".config/i3/config";
    source = "${config.home.sessionVariables.DOTFILES}/i3/legion/config";
  };
}
