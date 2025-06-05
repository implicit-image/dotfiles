{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  home.file = {
    "init.lua" = {
      target = "${config.xdg.configHome}/nvim/init.lua";
      source = "${config.home.sessionVariables.HM_FILES}/nvim/init.lua";
    };
    "lua" = {
      recursive = true;
      target = "${config.xdg.configHome}/nvim/lua";
      source = "${config.home.sessionVariables.HM_FILES}/nvim/lua";
    };
  };
}
