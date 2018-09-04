{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  d = { mkDerivation, base, stdenv }:
    mkDerivation {
      pname = "projectName";
      version = "0.0.0.1";
      src = ./src;
      isLibrary = true;
      isExecutable = true;
      libraryHaskellDepends = [ base ];
      executableHaskellDepends = [ base ];
      homepage = "blog.latukha.com";
      description = "Description text";
      license = stdenv.lib.licenses.bsd3;
    };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage d {};

in

  if pkgs.lib.inNixShell then drv.env else drv
