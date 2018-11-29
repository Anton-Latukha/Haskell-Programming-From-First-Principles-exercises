# Hydra jobset declaration
let
  pkgs = import <nixpkgs> { };

in
  pkgs.haskellPackages.callPackage ./derivation.nix {}

