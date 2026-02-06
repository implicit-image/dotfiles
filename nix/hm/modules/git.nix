{ config, pkgs, ... }:
{

  # emacs diff scripts
  # home.file = {

 #  }

  programs = {
    git = {
      enable = true;
      userEmail = "blaz.nie@protonmail.com";
      userName = "Błażej Niewiadomski";
      ignores = [
        "*~"
        "*.swp"
        "#*#"
        ".ccls-cache"
        "node_modules/*"
      ];
      # config = {
      #   difftool."ediff" = {
      #     cmd = "emacsclient -nw -u -q -a= -c -e \"$\""
      #   };
      # };
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };
  };
}
