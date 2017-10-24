with import <nixpkgs> {};

stdenv.mkDerivation rec {
  pname = "halite";
  version = "git";
  name = "${pname}-${version}";
  src = ./.;
  buildInputs = [ cmake ];

  meta = {
    homepage = https://github.com/HaliteChallenge/Halite-II;
    description = "Environment for Halite-II, open source artificial intelligence programming challenge";
    license = stdenv.lib.licenses.mit;
  };
}
