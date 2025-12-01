{
  lib,
  mkWallpaperPackage,
}:

let
  pname = "starrynix-resouces-wallpapers-landscape-illustration";
  displayName = "StarryNix-Resources Landscape Illustration Wallpapers";
  version = "0-unstable-2025-12-01";
in
mkWallpaperPackage {
  inherit pname displayName version;
  src = lib.sources.cleanSource ./wallpapers;

  meta = {
    description = "Landscape illustration wallpapers";
    license = lib.licenses.cc-by-40;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
