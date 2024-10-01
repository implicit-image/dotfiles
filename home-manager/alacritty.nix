{ config, lib, pkgs, ... }:

{
  home.file."alacritty.toml" = {
    target = ".config/alacritty/alacritty.toml";
    source = "${config.home.sessionVariables.DOTFILES}/alacritty/alacritty.toml";
  };
}
