{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # helix with plugins
    # FIXME: figure this shit out
    helix.url = "github:mattwparas/helix/a9d5557a3b3c11767432bdacd36ccb3bea02bfa5";
    steel.url = "github:mattwparas/steel/af792c7b3412b85fffe1b69b9e5cf2c752d39c36";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";

      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ nixpkgs, home-manager, helix, steel, ... }: {
    nixosConfigurations = {
      nixos =
        let
          system = "x86_64-linux";
          specialArgs = { inherit helix steel; };
          modules = [
            ./configuration.nix

            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users = {
                b = import ./b.nix;
              };
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.backupFileExtension = "backup";
            }
          ];
        in
          nixpkgs.lib.nixosSystem { inherit system modules specialArgs; };
    };
  };
}
