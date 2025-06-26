{
  description = "A C++/CMake project template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            cmake
            gcc
            # Add other dependencies here
          ];
        };

        packages.default = pkgs.stdenv.mkDerivation {
          name = "cpp-cmake-project";
          src = ./.;
          nativeBuildInputs = with pkgs; [ cmake ];
          # No install phase needed for a simple executable
        };
      });
}
