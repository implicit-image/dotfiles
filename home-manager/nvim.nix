{ config, lib, pkgs, ... }:

{
  home.file = {
    "init.lua" = {
      source = "${config.home.sessionVariables.DOTFILES}/nvim/init.lua";
      target = ".config/nvim/init.lua";
    };
    "nvim-plugins" = {
      recursive = true;
      source = "${config.home.sessionVariables.DOTFILES}/nvim/lua/plugins";
      target = ".config/nvim/lua/plugins";
    };
    "nvim-config" = {
      recursive = true;
      source = "${config.home.sessionVariables.DOTFILES}/nvim/lua/config";
      target = ".config/nvim/lua/config";
    };
  };
}
