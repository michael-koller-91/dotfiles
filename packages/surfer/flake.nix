{
  description = "Package surfer.";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.surfer =
      let pkgs = import nixpkgs {
        system = "x86_64-linux";
          };
      in pkgs.rustPlatform.buildRustPackage {
        pname = "surfer";

        version = "0.1.0";

        src = pkgs.fetchFromGitLab {
          owner = "surfer-project";
          repo = "surfer";
          rev = "main";
          hash = "";
        };

        cargoHash = "";

        cargoLock = {
          lockFile = ./Cargo.lock;
          allowBuiltinFetchGit = true;
        };

        buildInputs = with pkgs; [
          openssl
        ];
      };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.surfer;
  };
}

