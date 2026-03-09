{ config, pkgs, emacs-overlay, lem-overlay, ... }:
{
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.iog.io"
      "https://nix-wpe-webkit.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "nix-wpe-webkit.cachix.org-1:ItCjHkz1Y5QcwqI9cTGNWHzcox4EqcXqKvOygxpwYHE="
    ];
  };

  nixpkgs.overlays = [
    (import emacs-overlay)
    lem-overlay.overlays.default
  ];
}
