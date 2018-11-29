{ mkDerivation, base, hspec, stdenv, unicode-prelude }:
mkDerivation {
  pname = "Addition";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base hspec unicode-prelude ];
  executableHaskellDepends = [ base unicode-prelude ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
