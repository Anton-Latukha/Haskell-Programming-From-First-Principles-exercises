{ mkDerivation, base, checkers, QuickCheck, stdenv, unicode-prelude
}:
mkDerivation {
  pname = "04ShortExEitherMonad";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base checkers QuickCheck unicode-prelude
  ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
