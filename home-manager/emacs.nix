{ config, lib, pkgs, ... }:

{

  home.file = {
    ".emacs-profiles.el" = {
      target = ".emacs-profiles.el";
      source = "${config.home.sessionVariables.DOTFILES}/.emacs-profiles.el";
    };
    # "early-init.el" = {
    #   target = ".emacs.custom.d/early-init.el";
    #   source = "${config.home.sessionVariables.DOTFILES}/emacs/early-init.el";
    # };
    # "init.el" = {
    #   target = ".emacs.custom.d/init.el";
    #   source = "${config.home.sessionVariables.DOTFILES}/emacs/init.el";
    # };
  };
}
