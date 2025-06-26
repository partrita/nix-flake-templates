{
  description = "A Node.js application template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        nodejs = pkgs.nodejs_20; # Or your preferred Node.js version
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            nodejs
            pkgs.nodePackages.npm # or yarn, pnpm
          ];
        };

        packages.default = pkgs.stdenv.mkDerivation {
          name = "nodejs-app";
          src = ./.;
          buildInputs = [ nodejs pkgs.nodePackages.npm ];
          buildPhase = ''
            npm install
          '';
          installPhase = ''
            mkdir -p $out/bin
            cp index.js $out/bin/nodejs-app
            chmod +x $out/bin/nodejs-app
          ''; # A more robust solution would use nodePackages.buildPackage
        };
      });
}
