{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages = rec {
        evince = (import ./default.nix) { pkgs = nixpkgs.legacyPackages.${system}; };
        default = evince;
      };
    });
}
