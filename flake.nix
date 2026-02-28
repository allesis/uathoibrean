{
  description = "A Nix-flake-based Clojure development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = ["x86_64-linux" "x86_64-darwin"];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import nixpkgs {
            inherit system;
          };
        });
  in {
    devShells = forEachSupportedSystem ({pkgs}: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          # Language of choice
          clojure
          # Project manager for Clojure
          leiningen
          # Language Server for Clojure
          clojure-lsp
          # Linter for Clojure
          clj-kondo
          # Clojure formatter
          cljfmt

          #
          # quality of life stuff for non-clojure things
          #

          # Just a command runner
          just
          # Language Server for Just
          just-lsp
          # Language Server for Nix
          nil
          # Nix formatter
          alejandra
        ];
      };
    });
  };
}
