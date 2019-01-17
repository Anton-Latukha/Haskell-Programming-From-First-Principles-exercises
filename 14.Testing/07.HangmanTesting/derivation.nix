{ mkDerivation, base, QuickCheck, random, stdenv, unicode-prelude
}:
mkDerivation {
  pname = "Hangman";
  version = "0.2.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base QuickCheck random unicode-prelude
  ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
