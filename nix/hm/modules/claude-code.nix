{ config, pkgs, ... }:
{
  programs.claude-code = {
    enable = true;
    hooksDir = "${config.home.sessionVariables.DOTFILES}/claude-code/hooks";
    agentsDir  = "${config.home.sessionVariables.DOTFILES}/claude-code/agents";
    commandsDir = "${config.home.sessionVariables.DOTFILES}/claude-code/commands";
  };
}
