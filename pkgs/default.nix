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
  };
}
