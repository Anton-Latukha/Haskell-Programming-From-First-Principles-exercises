{ mkDerivation, base, hspec, stdenv, unicode-prelude }:
mkDerivation {
  pname = "ShortExMultiplication";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base hspec unicode-prelude ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
