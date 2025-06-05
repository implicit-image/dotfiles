{ config, pkgs, ... }:
{
  home.keyboard = {
    layout = "us,pl";
    options = [ "grp:alt_shift_toggle" ];
    variant = "qwerty";
    model = "pc104";
  };

  home.packages = with pkgs; [
    xorg.setxkbmap
    xorg.xkbutils
    xorg.xkbcomp
    xorg.xkbevd
  ];
}
