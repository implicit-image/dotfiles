{ config, pkgs, ... }:

{
  imports =
    [
      # wsl
      # <nixos-wsl/module>
    ];

   # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      #  wget
      git
      vim
      neovim
      btop
      unzip
      gzip
      zip
    ];
  };

  # Enable the OpenSSH daemon.
  services = {
    openssh.enable = true;
  };

  programs = {
    firefox = {
      enable = true;
      preferences = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
    zsh.enable = true;
    dconf.enable = true;
  };

  fonts.packages = with pkgs; let
    my-nerdfonts = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
    in
    my-nerdfonts; 

  users.users.b.shell = pkgs.zsh;
  # enable flake feature
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";

}
