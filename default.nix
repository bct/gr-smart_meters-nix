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

    gr-fosphor = gnuradio.pkgs.callPackage ./gr-fosphor {
      inherit gnuradio;
      inherit (gnuradio) python boost;
    };

    gmplot = gnuradio.pkgs.callPackage ./gmplot {
      inherit (gnuradio) python;
    };

    shell = mkShell {
      buildInputs = [
        (gnuradio.override {
          extraPackages = [
            gr-pdu_utils
            gr-sandia_utils
            gr-timing_utils
            gr-fhss_utils
            gr-smart_meters
            gr-fosphor
            soapyrtlsdr
          ];
          extraMakeWrapperArgs = [
            # make sure the soapy plugins can be found
            "--prefix" "SOAPY_SDR_PLUGIN_PATH" ":"
            "${
              lib.makeSearchPath "lib/SoapySDR/modules0.8" [soapyrtlsdr]
            }"
          ];
        })
        gnuradio.python
        gnuradio.python.pkgs.requests
        gnuradio.python.pkgs.simplekml
        gmplot
        (soapysdr.override {
          extraPackages = [ soapyrtlsdr ];
        })
      ];
    };
  };
in
packages
