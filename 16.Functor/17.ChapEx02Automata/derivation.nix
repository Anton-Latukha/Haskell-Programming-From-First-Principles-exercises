{ mkDerivation, base, QuickCheck, quickcheck-properties, stdenv
, unicode-prelude
}:
mkDerivation {
  pname = "ChapEx02Automata";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base QuickCheck quickcheck-properties unicode-prelude
  ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
