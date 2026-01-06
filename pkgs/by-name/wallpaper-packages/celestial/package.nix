{
  lib,
  mkWallpaperPackage,
}:

let
  pname = "starrynix-resouces-wallpapers-celestial";
  displayName = "StarryNix-Resources Celestial Wallpapers";
  version = "0-unstable-2026-01-06";
in
mkWallpaperPackage {
  inherit pname displayName version;
  src = lib.sources.cleanSource ./wallpapers;

  meta = {
    description = "Celestial wallpapers";
    license = lib.licenses.cc-by-40;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
