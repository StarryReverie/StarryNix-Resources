{
  pkgs ? import ((import ../.).inputs.nixpkgs) { },
  lib ? pkgs.lib,
}:
let
  callPackage = lib.customisation.callPackageWith (
    lib.attrsets.mergeAttrsList [
      pkgs
      buildSupport
      exportedPackages
    ]
  );

  buildSupport = {
    mkWallpaperPackage = callPackage ./build-support/mk-wallpaper-package { };
  };

  exportedPackages = import ./by-name/package-set.nix callPackage;
in
exportedPackages
