{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "brackets"
        "regexp"
        "root"
      ];
    };
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    shellAliases = {
      system-rebuild = "sudo nixos-rebuild switch";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "asdf"
      ];
      theme = "dallas";
    };
    plugins = [];
  };
}
