{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  d = { mkDerivation, base, stdenv, base-unicode-symbols, containers-unicode-symbols, QuickCheck }:
    mkDerivation {
      pname = "testingQuickChecksPatience";
      version = "0.0.0.1";
      src = ./src;
      isLibrary = true;
      isExecutable = true;
      libraryHaskellDepends = [ base base-unicode-symbols containers-unicode-symbols QuickCheck ];
      executableHaskellDepends = [ base base-unicode-symbols containers-unicode-symbols QuickCheck ];
      homepage = "blog.latukha.com";
      description = "Testing patience of QuickCheck.";
      license = stdenv.lib.licenses.bsd3;
    };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage d {};

in

  if pkgs.lib.inNixShell then drv.env else drv
