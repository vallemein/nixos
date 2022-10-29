{ stdenv, lib, tdesktop, glib-networking, webkitgtk, makeWrapper }:
with lib;
stdenv.mkDerivation {
  pname = "${tdesktop.pname}-with-webkit";
  version = tdesktop.version;
  nativeBuildInputs = [ makeWrapper ];
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    cp -r ${tdesktop}/share $out
  '';
  postFixup = ''
    mkdir -p $out/bin
    makeWrapper ${tdesktop}/bin/telegram-desktop $out/bin/telegram-desktop \
      --prefix GIO_EXTRA_MODULES : ${glib-networking}/lib/gio/modules \
      --prefix LD_LIBRARY_PATH : ${makeLibraryPath [ webkitgtk ]}
  '';
  meta = tdesktop.meta // {
    platforms = platforms.linux;
  };
}
