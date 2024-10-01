{ config, lib, pkgs, ... }:

{
  services.mpd = {
    enable = true;
  };
  services.mpdris2 = {
    enable = true;
    notifications = true;
    multimediaKeys = true;
  };
  home.file."mpd.conf" = {
    target = ".config/mpd/mpd.conf";
    source = "${config.home.sessionVariables.DOTFILES}/mpd/mpd.conf";
  };
}
