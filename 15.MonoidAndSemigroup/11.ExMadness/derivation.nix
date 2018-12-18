{ mkDerivation, base, stdenv }:
mkDerivation {
  pname = "ExMadness";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  homepage = "http://haskellbook.com/";
  description = "Synopsis text";
  license = stdenv.lib.licenses.bsd3;
}
