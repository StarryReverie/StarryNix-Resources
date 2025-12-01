{
  pkgs ? import <nixpkgs> { },
  lib ? pkgs.lib,
  callPackage ? pkgs.callPackage,
}:
let
  buildSupport = {
    mkWallpaperPackage = callPackage ./build-support/mk-wallpaper-package { };
  };
in
{
  wallpaperPackages = {
    digital-art = callPackage ./by-name/wallpaper-packages/digital-art/package.nix {
      inherit (buildSupport) mkWallpaperPackage;
    };

    landscape-illustration = callPackage ./by-name/wallpaper-packages/landscape-illustration/package.nix {
      inherit (buildSupport) mkWallpaperPackage;
    };
  };
}
