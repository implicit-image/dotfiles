{ config, pkgs, ... }:
{
  home = {
    sessionVariables = {
      SHELL = "zsh";
      DOTFILES = "${config.home.homeDirectory}/repos/dotfiles";
      HM_FILES = "${config.home.homeDirectory}/repos/nixos-config/hm-files";
      PROJECTS = "${config.home.homeDirectory}/projects";
      REPOS = "${config.home.homeDirectory}/repos";
      PROGRAMMING = "${config.home.homeDirectory}/programming";
      UV_PYTHON = "${pkgs.python312Full}";
    };
  };
}
