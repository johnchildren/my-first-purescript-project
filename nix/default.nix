{ sources ? import ./sources.nix }:
with
  { overlay = _: pkgs:
      { niv = import sources.niv {};
        easyPS = import sources.easy-purescript-nix {};
      };
  };
import sources.nixpkgs
  { overlays = [ overlay ] ; config = {}; }
