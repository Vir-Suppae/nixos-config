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
    };
}
# {
#     description = "my nixos system flake";
#     inputs = {
#         nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
#         home-manager = {
#             url = "github:nix-community/home-manager";
#             inputs.nixpkgs.follows = "nixpkgs";
#         };
#         mangowm = {
#             url = "github:mangowm/mango";
#             inputs.nixpkgs.follows = "nixpkgs";
#         };
#     };
#     outputs = inputs: {
#         nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
#             modules = [
#                 ./configuration.nix
#                 inputs.home-manager.nixosModules.home-manager

#                 {
#                     home-manager.useGlobalPkgs = true;
#                     home-manager.useUserPackages = true;
#                     home-manager.backupFileExtension = "bak";

#                     home-manager.users."vir-suppae" = import ./home/home.nix;
#                 }
#                 inputs.mangowm.nixosModules.mango
#             ];
#         };
#     };
# }
