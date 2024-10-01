{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "blaz.nie@protonmail.com";
    userName = "Błażej Niewiadomski";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      protocol = {
        "ssh".allow = "always";
      };
    };
  };
}
