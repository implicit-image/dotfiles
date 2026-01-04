{ config, pkgs, ... }:
{

  # home.file =  {
  #   ".local/bin/,nixos-rebuild" = {
  #     executable = true;
  #     force = true;
  #     text = builtins.readFile "${config.home.sessionVariables.DOTFILES}/nix/scripts/,nix-rebuild.sh";
  #   };
  # };


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
      edbg = "emacs --debug-init ";
      tedbg = "emacs --debug-init -nw";
      e = "emacsclient -q -u --alternate-editor= -c";
      te = "emacsclient -q -u --alternate-editor= -nw -c";
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
