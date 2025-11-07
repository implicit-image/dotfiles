{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-git;
    extraPackages = epkgs: [ epkgs.lsp-bridge ];
  };

  xdg.desktopEntries = {
    "emacs-pdf" = {
      name = "Emacs pdf";
      genericName = "PDF Reader";
      exec = "emacsclient -c %U";
      terminal = false;
      categories = [ "Application" ];
      mimeType = [ "application/pdf" ];
    };
    # "emacs-dired" = {
    #   name = "Emacs Dired";
    #   genericName = "Directory Browser";
    #   exec = "emacsclient -c %U";
    #   terminal = false;
    #   categories = ["Application"];
    #   mimeType = [ "" ];
    # }
  };

  home.packages = with pkgs; [
    # formatters
    cljfmt
    # spellcheckers
    hunspell
    hunspellDicts.pl-pl
    hunspellDicts.en_US
    hunspellDicts.el_GR
  ];

}
