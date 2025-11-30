{
  lib,
  stdenvNoCC,
}:

let
  pname = "starrynix-resouces-wallpapers-digital-art";
  version = "0-unstable-2025-11-30";
in
stdenvNoCC.mkDerivation {
  inherit pname version;

  src = ./wallpapers;
  kdeMetadata = ./metadata.desktop;

  installPhase = ''
    runHook preInstall

    local bg_dir=$out/share/backgrounds/${pname}
    local gnome_xml_dir=$out/share/gnome-background-properties
    local kde_wp_dir=$out/share/wallpapers/${pname}
    local xml_file=$gnome_xml_dir/${pname}.xml

    # Do installation
    mkdir -p $bg_dir
    mkdir -p $gnome_xml_dir
    mkdir -p $kde_wp_dir/contents
    cp -r * $bg_dir/
    ln -s $bg_dir $kde_wp_dir/contents/images

    # Write GNOME metadata
    touch $xml_file
    echo >> $xml_file '<?xml version="1.0" encoding="UTF-8"?>'
    echo >> $xml_file '<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">'
    echo >> $xml_file '<wallpapers>'

    for img in "$bg_dir"/*; do
      if [ -f "$img" ]; then
        filename=$(basename "$img")
        name="''${filename%.*}"

        echo >> $xml_file '  <wallpaper deleted="false">'
        echo >> $xml_file '    <name>'"$name"'</name>'
        echo >> $xml_file '    <filename>'"$img"'</filename>'
        echo >> $xml_file '    <options>zoom</options>'
        echo >> $xml_file '    <pcolor>#000000</pcolor>'
        echo >> $xml_file '    <scolor>#000000</scolor>'
        echo >> $xml_file '    <shade_type>solid</shade_type>'
        echo >> $xml_file '  </wallpaper>'
      fi
    done

    echo >> $xml_file '</wallpapers>'

    # Write KDE metadata
    cp $kdeMetadata $kde_wp_dir/metadata.desktop

    runHook postInstall
  '';

  meta = {
    description = "Digital art wallpapers";
    license = lib.licenses.cc-by-40;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
