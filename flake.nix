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
        version = "1.2.4";
      in {
        packages.default = pkgs.buildGoModule {
          inherit version;
          pname = "nctl";
          src = pkgs.fetchFromGitHub {
            owner = "ninech";
            repo = "nctl";
            rev = "v${version}";
            sha256 = "sha256-58+qLtik0GgUGG1mkLHObcxGcg18roj69msS+AXfKDk=";
          };
          vendorHash = "sha256-A2OAcgdPOdc6EWo/0KPbUCVIJ1Mi5CkYPWK76wB8L3U=";
        };
      });
}
