{
  lib,
  mkWallpaperPackage,
}:

let
  pname = "starrynix-resouces-wallpapers-digital-art";
  displayName = "StarryNix-Resources Digital Art Wallpapers";
  version = "0-unstable-2025-11-30";
in
mkWallpaperPackage {
  inherit pname displayName version;
  src = lib.sources.cleanSource ./wallpapers;

  meta = {
    description = "Digital art wallpapers";
    license = lib.licenses.cc-by-40;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
