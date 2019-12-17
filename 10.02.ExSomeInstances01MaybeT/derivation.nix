{ mkDerivation, base, stdenv, unicode-prelude }:
mkDerivation {
  pname = "1002ExSomeInstances01MaybeT";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base unicode-prelude ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
