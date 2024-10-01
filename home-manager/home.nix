{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./ssh.nix
    ./dunst.nix
    ./i3.nix
    ./alacritty.nix
    ./picom.nix
    ./mpd.nix
    ./nvim.nix
    # ./theming.nix
    ./zsh.nix
    ./xdg.nix
    # ./scripts.nix
    ./redshift.nix
    ./emacs.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "b";
  home.homeDirectory = "/home/b";

  home.sessionVariables = {
    DOTFILES = ~/repos/dotfiles;
    SCRIPTS = ~/repos/scripts;
    GAMES = /storage/games;
    WINE_PREFIX_DEFAULT = /storage/games/default;
    WINE_PREFIX_DOW = /storage/games/dow;
    WINE_PREFIX_NWN2 = /storage/games/Neverwinter-Nights-2-Complete;
  };



  home.stateVersion = "24.05"; # Please read the comment before changing.
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
