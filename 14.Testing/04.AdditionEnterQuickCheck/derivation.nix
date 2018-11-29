{ mkDerivation, base, hspec, QuickCheck, stdenv }:
mkDerivation {
  pname = "AdditionEnterQuickCheck";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base hspec QuickCheck ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
