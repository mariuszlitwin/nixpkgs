{ stdenv, fetchurl, cmake, zlib, qt5, python3, python35Packages, protobuf3_2, gmock }:

stdenv.mkDerivation rec {
  name = "veles-${version}";
  version = "2017.02.0";

  src = fetchurl {
    url = "https://github.com/codilime/veles/archive/2017.2.0.YAGNI.tar.gz";
    sha256 = "0j4qqgvnw9685hpsw0wp8hii8hridzdb5wmfk7zz2ids5hcx3b2k";
  };

  buildInputs = [
    cmake zlib qt5.qtbase 
    protobuf3_2 gmock
    python3 python35Packages.virtualenv python35Packages.protobuf3_2
  ];

  prebuildPhase = ''
    mkdir build
    cd build
    cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX:PATH=$out ..
  '';

  meta = with stdenv.lib; {
    description = "QT-based tool for visual analysis of binary files.";
    homepage = https://codisec.com/veles/;
    license = licenses.asl20;
    maintainers = [ maintainers.mariuszlitwin ];
    platforms = platforms.unix;
    inherit version;
  };
}
