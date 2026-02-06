{ config, pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    extraConfig = builtins.readFile "${config.home.sessionVariables.DOTFILES}/btop/btop.conf";
  };
}
