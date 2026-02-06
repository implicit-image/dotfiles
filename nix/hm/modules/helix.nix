{ config, pkgs, lib, ... }:
{

  home.sessionVariables.EDITOR = lib.mkDefault "hx";


  home.file = {
    "helix" = {
      recursive = true;
      target = "${config.xdg.configHome}/helix";
      source = "${config.home.sessionVariables.DOTFILES}/helix";
    };
  };

  programs.helix = {
    enable = true;
  };
}
