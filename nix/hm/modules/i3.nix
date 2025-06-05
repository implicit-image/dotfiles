{ config, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
  };

  home.file."i3" = {
    recursive = true;
    target = "${config.xdg.configHome}/i3";
    source = "${config.home.sessionVariables.HM_FILES}/i3/ideapad";
  };
}
