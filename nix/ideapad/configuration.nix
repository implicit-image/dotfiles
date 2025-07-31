# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # basic network config
      ../nixos/modules/network.nix

      #bluetooth config
      ../nixos/modules/bluetooth.nix

      # sound
      ../nixos/modules/sound.nix

      ../nixos/modules/filesystem.nix

      # graphics
      ./nixos/modules/graphics.nix

      # steam
      ./nixos/modules/steam.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Configure keymap in X11

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.b = {
    isNormalUser = true;
    description = "b";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    git
    vim
    neovim
    btop
    unzip
    gzip
    zip
    xarchiver
    stdmanpages
  ];

  environment.pathsToLink = [ "/share/zsh" ];
  services.libinput.touchpad = {
    tapping = false;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services = {
    openssh.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us, pl";
        options = "grp:alt_shift_toggle, ctrl:swapcaps";
      };
      autoRepeatDelay = 300;
      autoRepeatInterval = 30;
      displayManager = {
        defaultSession = "none+i3";
        lightdm = {
          enable = true;
        };
      };
      videoDrivers = [
        "intel"
        "modesetting"
      ];
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3lock
          i3status-rust
          lightlocker
          i3status
          networkmanagerapplet
          rofi
          xterm
          kitty
          dmenu
        ];
      };
    };
  };

  programs = {
    xfconf.enable = true;
    firefox = {
      enable = true;
      preferences = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
    nm-applet = {
      enable = true;
      indicator = false;
    };
    dconf = {
      enable = true;
    };
  };

  fonts = {
    packages = with pkgs; let
      my-nerdfonts = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
    in
      my-nerdfonts
      ++ [
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        font-awesome
        source-han-sans
        source-han-sans-japanese
        source-han-serif-japanese];
  };


  # enable flake feature
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
