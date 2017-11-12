with import <nixpkgs> {};

let
  _zstd = with python3.pkgs; buildPythonPackage rec {
    pname = "zstd";
    version = "1.3.1";
    name = "${pname}-${version}";

    doCheck = false;

    src  = fetchPypi {
      inherit pname version;
      sha256 = "0mmkpc73m4mhyllqbs583230pb7a2n2s5pk8hag2g4y5hi1hndfh";
    };
  };

  _py3 = python3.withPackages (ps: with ps; [ requests _zstd ]);
in
python3.pkgs.buildPythonPackage rec {
  pname = "hlt-client";
  version = "git";
  name = "${pname}-${version}";
  src  = ./.;

  propagatedBuildInputs = [ _py3 ];

  meta = {
    homepage = https://github.com/HaliteChallenge/Halite-II;
    description = "Command line client for Halite-II, open source artificial intelligence programming challenge";
    license = stdenv.lib.licenses.mit;
  };
}
