{ mkDerivation, base, containers, QuickCheck, stdenv }:
mkDerivation {
  pname = "MorseCode";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base containers QuickCheck ];
  executableHaskellDepends = [ base containers QuickCheck ];
  testHaskellDepends = [ base containers QuickCheck ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
