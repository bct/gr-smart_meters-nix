{
  pkgs
, gnuradio
, boost
, python
, gr-pdu_utils
, gr-timing_utils
}:

pkgs.stdenv.mkDerivation {
  pname = "gr-fhss_utils";
  version = "3.10";

  src = pkgs.fetchgit {
    url = "https://github.com/sandialabs/gr-fhss_utils.git";
    rev = "32feece5ee802d048b6b1c988a38ca9b6f4675af";
    sha256 = "1i7ar4chka5vpp4lvsm4dnkyfq74f168bqqs83mh8z48h8fdkpib";
  };

  nativeBuildInputs = [
    pkgs.cmake
    python.pkgs.pybind11
  ] ++ gnuradio.pythonPkgs;

  buildInputs = [
    gnuradio
    boost
    gr-pdu_utils
    gr-timing_utils
    pkgs.spdlog
    pkgs.gmp
    pkgs.volk
  ];
}
