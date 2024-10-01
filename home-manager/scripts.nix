{ config, lib, pkgs, ... }:

{
  home.file = {
    target = ".local/bin/reload.sh";
    source = "${config.home.sessionVariables.DOTFILES}/reload.sh";
  };
}
