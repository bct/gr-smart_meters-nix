{
  pkgs
, gnuradio
, boost
, python
, gr-pdu_utils
, gr-sandia_utils
}:

pkgs.stdenv.mkDerivation {
  pname = "gr-timing_utils";
  version = "3.10";

  src = pkgs.fetchgit {
    url = "https://github.com/sandialabs/gr-timing_utils.git";
    rev = "454dfc40a1aa761337ddfaf58e98f46472d6cf62";
    sha256 = "1m3prljq8k7d38d6ilvmhyj0jc5nq9b300l3n53khvyw9a0fgybs";
  };

  nativeBuildInputs = [
    pkgs.cmake
    python.pkgs.pybind11
  ] ++ gnuradio.pythonPkgs;

  buildInputs = [
    gnuradio
    boost
    gr-pdu_utils
    gr-sandia_utils
    pkgs.spdlog
    pkgs.gmp
    pkgs.volk
  ];
}
