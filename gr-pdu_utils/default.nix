{
  pkgs
, gnuradio
, boost
, python
}:

pkgs.stdenv.mkDerivation {
  pname = "gr-pdu_utils";
  version = "3.10";

  src = pkgs.fetchgit {
    url = "https://github.com/sandialabs/gr-pdu_utils.git";
    rev = "68984503712114bbabb4d6b8814d3997144f025b";
    sha256 = "1z2mh10zvv8xwpzgs6l9ywyywk47axvvmdmwgdmkribkv49yzsql";
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
  ];

  propagatedBuildInputs = [
    gnuradio.python.pkgs.numpy
  ];
}
