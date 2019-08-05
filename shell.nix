{ pkgs ? import ./nix {} }:

pkgs.mkShell {
  buildInputs = with pkgs.easyPS; [ purs spago dhall-simple ];
}
