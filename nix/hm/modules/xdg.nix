{ config, pkgs, ... }:
{
  xdg = {
    enable = true;
    mime = {
      enable = true;
      sharedMimeInfoPackage = pkgs.shared-mime-info;
      desktopFileUtilsPackage = pkgs.desktop-file-utils;
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = ["emacs-pdf.desktop"];
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    desktopEntries = {
      # open pdfs in emacs if client is running
      "emacs-pdf" = {
        name = "Emacs pdf";
        genericName = "PDF Reader";
        exec = "emacsclient -c -a %U";
        terminal = false;
        categories = [ "Application" ];
        mimeType = [ "application/pdf" ];
      };
    };
  };
}
