# Nix-build default file. Use callpackage to call derivation.nix
{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:
nixpkgs.pkgs.haskellPackages.callPackage ./derivation.nix { }
