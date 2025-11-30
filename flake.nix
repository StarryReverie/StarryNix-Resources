{
  description = "StarryNix-Resources";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    flake-compat = {
      url = "https://git.lix.systems/lix-project/flake-compat/archive/main.tar.gz";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts/main";
    };
  };

  outputs =
    { self, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem =
        { self', pkgs, ... }:
        {
          devShells.default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              nil
              nixfmt-rfc-style
            ];
          };

          formatter = pkgs.nixfmt-tree;

          legacyPackages = import ./pkgs { inherit pkgs; };

          packages = inputs.nixpkgs.lib.filterAttrs (
            _: value: inputs.nixpkgs.lib.isDerivation value
          ) self'.legacyPackages;
        };
    };
}
