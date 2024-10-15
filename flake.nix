{
  description = "A flake for nctl tool from nine.ch";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        version = "1.7.7";
      in {
        packages.default = pkgs.buildGoModule {
          inherit version;
          pname = "nctl";
          src = pkgs.fetchFromGitHub {
            owner = "ninech";
            repo = "nctl";
            rev = "v${version}";
            sha256 = "sha256-wwF11RUMVgJpDtXmgGa3ZQkyc10/mhSqkiPXb+t+B74=";
          };
          vendorHash = "sha256-74EjwbxwlQH+6hCsMcpY/U2GrtIsIiL2TG/8EBuXE1c=";
        };
      });
}
