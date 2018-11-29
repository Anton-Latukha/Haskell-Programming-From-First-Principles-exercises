{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  d = { mkDerivation, base, base-unicode-symbols, containers, containers-unicode-symbols, morse, QuickCheck, stdenv }:
  mkDerivation {
    pname = "MorseCode";
    version = "0.0.0.1";
    src = ./.;
    isLibrary = true;
    isExecutable = true;
    libraryHaskellDepends = [ base base-unicode-symbols containers containers-unicode-symbols morse QuickCheck ];
    executableHaskellDepends = [ base base-unicode-symbols containers containers-unicode-symbols morse QuickCheck ];
    testHaskellDepends = [ base containers morse QuickCheck ];
    homepage = "http://haskellbook.com/";
    description = "Synopsis text";
    license = stdenv.lib.licenses.bsd3;
  };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage d {};

in

  if pkgs.lib.inNixShell then drv.env else drv
