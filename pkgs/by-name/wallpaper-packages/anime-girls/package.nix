{
  lib,
  mkWallpaperPackage,
}:

let
  pname = "starrynix-resouces-wallpapers-anime-girls";
  displayName = "StarryNix-Resources Anime Girls Wallpapers";
  version = "0-unstable-2026-01-14";
in
mkWallpaperPackage {
  inherit pname displayName version;
  src = lib.sources.cleanSource ./wallpapers;

  meta = {
    description = "Anime girls wallpapers";
    license = lib.licenses.cc-by-40;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}

