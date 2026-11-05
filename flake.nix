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
            };
            modules = [
                ./modules/conf.nix
            ];
        };
        packages = builtins.mapAttrs (system: pkgs: {
            luattyss = pkgs.callPackage ./packages/luattyss/package.nix {};
        }) inputs.nixpkgs.legacyPackages;
    };
}
