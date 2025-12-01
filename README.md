# StarryNix-Resources

## Overview

Declaratively managed resources needed by other infrastructures and systems.

## Getting Started

This project is based on the Nix flake, while non-flake usage is allowed as well. In terms of flake, add the following code snippet to your `flake.nix` to make your flake dependent on StarryNix-Resources:

```nix
{
  inputs = {
    starrynix-resources = {
      url = "github:StarryReverie/starrynix-resources/master";
      inputs.nixpkgs.follows = "nixpkgs"; # Optional but recommended
    };

    # ...
  };
}
```

Assuming that all flake inputs are passed to the NixOS configuration as a special argument `inputs`, you can add packages from this repository by writing the follow code:

```nix
{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = [
    # ...
  ] ++ (with inputs.starrynix-resources.legacyPackages.${pkgs.stdenv.hostPlatform.system}; [
    wallpaperPackages.digital-art
    # Add other packages from StarryNix-Resources here ...
  ]);

  environment.pathsToLink = [
    # For wallpaper packages
    "/share/backgrounds" # GNOME
    "/share/wallpapers" # KDE Plasma
  ];
}
```

## Passthrough Output

Packages from StarryNix-Resources typically provides passthrough output, which means that installing packages to the whole system environment is not necessary, instead, it's possible to refer ot them using the attrset keys. This keeps your system profile clean and avoids your configuration depending on weak-typed path strings.

### Wallpapers

All wallpapers provides these passthrough outputs:

```nix
{
  passthru = {
    wallpaperDir = "${final}/share/backgrounds/${pname}";
    gnomeFileDir = "${final}/share/backgrounds/${pname}";
    kdeFileDir = "${final}/share/wallpapers/${pname}/contents/images";
  };
}
```

The wallpaper directory, for example, is retrieved from `wallpaperPackages.digital-art.wallpaperDir`.

Note that the actual definition of those passthrough values may be subjected to change. There is no guarantee for its stability.

## License

This repository is licensed under the [MIT License](LICENSE), except all external resources which are licensed according to the original authors' requirements.

Copyright (C) 2025 Justin Chen
