{
  pkgs
, gnuradio
, boost
, python
}:

pkgs.stdenv.mkDerivation {
  pname = "gr-fosphor";
  version = "974ab2fe54";

  dontWrapQtApps = true;

  src = pkgs.fetchgit {
    url = "https://gitea.osmocom.org/sdr/gr-fosphor.git";
    rev = "974ab2fe54c25e8b6c37aa4de148ba0625eef652";
    sha256 = "1p3x0f8g1ccvkmrjwxn3kz58a71r8p4bjgpvx06fkj5fgwmnfa29";
  };

  nativeBuildInputs = [
    pkgs.cmake
    python.pkgs.pybind11
  ] ++ gnuradio.pythonPkgs;

  buildInputs = [
    gnuradio
    boost
    pkgs.spdlog
    pkgs.gmp
    pkgs.volk

    #  not sure which of these i need
    pkgs.intel-ocl
    pkgs.opencl-headers
    pkgs.ocl-icd

    # should inherit this from gnuradio somehow
    pkgs.libsForQt5.qt5.qtbase

    pkgs.glfw
  ];
}
