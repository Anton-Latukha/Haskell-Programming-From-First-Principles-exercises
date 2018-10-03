{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  d = { mkDerivation, base, stdenv, hspec }:
    mkDerivation {
      pname = "ExOptionalMonoid";
      version = "0.0.0.1";
      src = ./src;
      isLibrary = true;
      isExecutable = true;
      libraryHaskellDepends = [ base hspec ];
      executableHaskellDepends = [ base hspec ];
      homepage = "blog.latukha.com";
      description = "Description";
      license = stdenv.lib.licenses.bsd3;
    };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage d {};

in

  if pkgs.lib.inNixShell then drv.env else drv
