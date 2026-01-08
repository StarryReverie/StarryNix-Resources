callPackage: {
  celestial = callPackage ./celestial/package.nix { };

  digital-art = callPackage ./digital-art/package.nix { };

  landscape-illustration = callPackage ./landscape-illustration/package.nix { };

  minimalism = callPackage ./minimalism/package.nix { };
}
