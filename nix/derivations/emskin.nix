{ pkgs ? import <nixpkgs> {} }:
let
  rustPlatform = pkgs.rustPlatform;

  # Fetch the patched smithay dependency from the custom branch.
  # Replace `rev` with a specific commit hash for reproducibility.
  smithay = builtins.fetchGit {
    url = "https://github.com/emskin/smithay.git";
    ref = "emskin-patches";
    rev = "4d3e1c86f1b0a4fb7df876db0af849f4bba06f88";   # <-- required for deterministic builds
  };
  emskin = builtins.fetchGit {
      url = "https://github.com/emskin/emskin";
      ref = "main";
      rev = "6c26440dfbb6ae1e3dff9e8f14902ff4157d9a0c";
  };
in
  rustPlatform.buildRustPackage (final: {
    pname = "emskin";
    version = "0.3.12";

    src = emskin ;

    # Use the Cargo.lock that must be present in the source tree.
    # If smithay is not already in the lock file, you need to provide its output hash:
    cargoLock = {
      lockFile = ./emskin.lock;
      # outputHashes = {
      #   "smithay-0.3.0" = "sha256-...";   # calculate with `nix run nixpkgs#nix-prefetch-git ...`
      # };
    };

    # postPatch  = ''
    #   ln -s ${./Cargo.lock} Cargo.lock
    # '';

    nativeBuildInputs = with pkgs; [ pkg-config ];
    buildInputs = with pkgs; [ wayland libxkbcommon mesa ];

    # Enable LTO as specified in Cargo.toml [profile.release]
    CARGO_PROFILE_RELEASE_LTO = "true";

    meta = with pkgs.lib; {
      description = "Emskin Wayland compositor";
      homepage = "https://github.com/emskin/emskin";
      license = licenses.gpl3;
      maintainers = [ maintainers.le ];
    };
  })
