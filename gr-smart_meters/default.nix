{
  pkgs
, gnuradio
, boost
, python
}:

pkgs.stdenv.mkDerivation {
  pname = "gr-smart_meters";
  version = "3.10";

  src = pkgs.fetchgit {
    url = "https://github.com/BitBangingBytes/gr-smart_meters.git";
    rev = "77e9ebeda7f7d1a755bc6f43a05e0c3b7a251948";
    sha256 = "109dm3dh14wk40zw5vcrzsni9y5ck9wjvkac845xg328hy55lwzm";
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
}
