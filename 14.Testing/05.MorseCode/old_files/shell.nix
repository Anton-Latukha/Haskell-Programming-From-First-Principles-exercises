{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, containers, Morse, QuickCheck, stdenv
      }:
      mkDerivation {
        pname = "MorseCode";
        version = "0.0.0.1";
        src = ./.;
        isLibrary = true;
        isExecutable = true;
        libraryHaskellDepends = [ base containers QuickCheck ];
        executableHaskellDepends = [ base containers Morse QuickCheck ];
        testHaskellDepends = [ base containers Morse QuickCheck ];
        homepage = "http://haskellbook.com/";
        description = "Synopsis text";
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in

  if pkgs.lib.inNixShell then drv.env else drv
