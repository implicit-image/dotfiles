{ config, pkgs, lib, ... }:
{
  home.sessionVariables.TERM = lib.mkDefault "kitty";

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    # settings = {
    #   font_family = (import ./user-vars.nix).UI_FONT_FAMILY;
    #   bold_font = "auto";
    #   italic_font = "auto";
    #   bold_italic_font = "auto";
    #   font_size = 16;
    #   shell = "${config.home.sessionVariables.SHELL}";
    # };
  };
}
