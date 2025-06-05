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
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
