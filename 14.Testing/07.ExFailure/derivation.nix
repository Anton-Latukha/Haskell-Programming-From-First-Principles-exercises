{ mkDerivation, base, QuickCheck, stdenv, unicode-prelude }:
mkDerivation {
  pname = "Failure";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base QuickCheck unicode-prelude ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
