{ mkDerivation, base, random, stdenv, unicode-prelude }:
mkDerivation {
  pname = "03EvaluatingIoActionsMultipleTimes";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base random unicode-prelude ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
