{ config, pkgs, ... }:
{

  qt = {
    enable = true;
    style = {
      name = "adwaita-dark";
    };
  };
  gtk = {
    enable = true;
    cursorTheme = {
      name = "vimix-cursors";
      package = pkgs.vimix-cursors;
      size = 20;
    };
    font = {
      name = "Iosevka Nerd Font Mono";
      package = pkgs.nerd-fonts.iosevka;
      size = 12;
    };
    iconTheme = {
      name = "vimix-icons";
      package = pkgs.vimix-icon-theme;
    };
    theme = {
      name = "adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };
}
