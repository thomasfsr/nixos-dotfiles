{
  description = "Mango on Nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      home-manager.url = "github:nix-community/home-manager/release-27.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      mangowm,
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
              useUserPackages = true;
              users.tfsr = import ./home.nix;
              backupFileExtension = "backup";

            };
          }
        ];
      };
    };
}
