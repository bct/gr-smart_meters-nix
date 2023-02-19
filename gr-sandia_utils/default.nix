{
  pkgs
, gnuradio
, boost
, python
, gr-pdu_utils
}:

pkgs.stdenv.mkDerivation {
  pname = "gr-sandia_utils";
  version = "3.10";

  src = pkgs.fetchgit {
    url = "https://github.com/sandialabs/gr-sandia_utils.git";
    rev = "d71dd7a2af54309a2c88982dfaa0747dad1cc8ca";
    sha256 = "0phhys3qbxvgjr21ikxwa6ap3cg1p7fixzi6kkzd82x43p96y8ns";
  };

  nativeBuildInputs = [
    pkgs.cmake
    python.pkgs.pybind11
  ] ++ gnuradio.pythonPkgs;

  buildInputs = [
    gnuradio
    boost
    gr-pdu_utils
    pkgs.spdlog
    pkgs.gmp
    pkgs.volk
  ];
}
