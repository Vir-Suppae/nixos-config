{
    description = "my nixos system flake";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        wrappers = {
            url = "github:BirdeeHub/nix-wrapper-modules";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = inputs: {
        nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {
                inherit inputs;

                unipicker = inputs.nixpkgs.legacyPackages.x86_64-linux.callPackage
                    ./packages/unipicker/package.nix
                    {};
            };
            modules = [
                ./modules/conf.nix
            ];
        };
    };
}
