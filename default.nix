{ pkgs ? import <nixpkgs> { } }:
let
  pypkgs-build-requirements = {
    django-anymail = ["hatchling"];
    urllib3 = ["hatchling"];
    sqlparse = ["flit-core"];
  };
  myPoetryOverrides = pkgs.poetry2nix.defaultPoetryOverrides.extend (final: prev:
    builtins.mapAttrs
      (package: build-requirements:
        (builtins.getAttr package prev).overridePythonAttrs (old: {
          buildInputs = (old.buildInputs or [ ]) ++ (builtins.map (pkg: if builtins.isString pkg then builtins.getAttr pkg prev else pkg) build-requirements);
        })
      )
      pypkgs-build-requirements
  );
in
  pkgs.poetry2nix.mkPoetryApplication {
    projectDir = ./.;
    overrides = myPoetryOverrides;
    extras = [];
  }
