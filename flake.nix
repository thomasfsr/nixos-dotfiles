{
  description = "Mango on Nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zvm = {
      url = "github:tristanisham/zvm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      mangowm,
      zvm,
      ...
    }:
    {
      nixosConfigurations.mango-btw = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          mangowm.nixosModules.mango
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;

              extraSpecialArgs = {
                inherit zvm;
              };
              useUserPackages = true;
              users.tfsr = import ./home.nix;
              backupFileExtension = "backup";

            };
          }
        ];
      };
    };
}
