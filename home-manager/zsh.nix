{ config, lib, pkgs, ... }:

{
  home.file.".zshrc" = {
    target = ".zshrc";
    source = "${config.home.sessionVariables.DOTFILES}/.zshrc";
  };
}
