{ mkDerivation, base, QuickCheck, stdenv }:
mkDerivation {
  pname = "ExMaybeAnotherMonoid";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base QuickCheck ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
