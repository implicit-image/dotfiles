{ config, pkgs, ... }:
{

  qt = {
    enable = true;
    style = {
      name = "Adwaita Dark";
    };
  };
  gtk = {
    enable = true;
    colorScheme = "dark";
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
      package = pkgs.vimix-gtk-theme;
    };
    theme = {
      name = "Adwaita Dark";
      package = pkgs.gnome-themes-extra;
    };
  };
}
