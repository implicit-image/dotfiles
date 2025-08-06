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
  };
}
