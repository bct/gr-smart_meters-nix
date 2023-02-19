{ pkgs ? import <nixpkgs> { }
, python ? pkgs.python39 }:

python.pkgs.buildPythonPackage {
  pname = "gmplot";
  version = "1.4.1";

  src = pkgs.fetchgit {
    url = "https://github.com/gmplot/gmplot.git";
    rev = "80b421bd68faf43ec58549beefc817c7425ef80c";
    sha256 = "0x5xvnrj7rcdvnnblxf2pm0805ajyxgsgjd4za3wfvrlyxb9f9qr";
  };

  buildInputs = [
    python.pkgs.requests
  ];

  doCheck = false;
}
