{ pkgs ? import <nixpkgs> { }
}:

with pkgs;
with pkgs.lib;
let
  packages = rec {
    gr-pdu_utils = gnuradio.pkgs.callPackage ./gr-pdu_utils {
      inherit gnuradio;
      inherit (gnuradio) python boost;
    };

    gr-sandia_utils = gnuradio.pkgs.callPackage ./gr-sandia_utils {
      inherit gnuradio;
      inherit (gnuradio) python boost;
      inherit gr-pdu_utils;
    };

    gr-timing_utils = gnuradio.pkgs.callPackage ./gr-timing_utils {
      inherit gnuradio;
      inherit (gnuradio) python boost;
      inherit gr-pdu_utils gr-sandia_utils;
    };

    gr-fhss_utils = gnuradio.pkgs.callPackage ./gr-fhss_utils {
      inherit gnuradio;
      inherit (gnuradio) python boost;
      inherit gr-pdu_utils gr-timing_utils;
    };

    gr-smart_meters = gnuradio.pkgs.callPackage ./gr-smart_meters {
      inherit gnuradio;
      inherit (gnuradio) python boost;
    };

    shell = mkShell {
      buildInputs = [
        gnuradio
        gnuradio.python
        gr-pdu_utils
        gr-sandia_utils
        gr-timing_utils
        gr-fhss_utils
        gr-smart_meters
      ];
    };
  };
in
packages