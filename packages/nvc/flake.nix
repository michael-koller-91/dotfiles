{
  description = "Package nvc.";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.nvc =
      let pkgs = import nixpkgs {
            system = "x86_64-linux";
          };
      in pkgs.stdenv.mkDerivation {
        pname = "nvc";

        version = "1.11.3";

        src = pkgs.fetchFromGitHub {
	  owner = "nickg";
	  repo = "nvc";
	  rev = "r1.11.3";
 	  hash = "sha256-Z4YxXPf8uKlASSK9v6fbtHtkUibc9EeA4i+3kD/vBmY=";
        };

	preConfigure = ''
	  mkdir build
	  cd build
	'';

	configureScript = "../configure";

	configureFlags = [
	  "--enable-vhpi"
	  "--disable-lto"
	];

	# an alternative to the above three attributes is the following:
	# (note that --prefix=$out then needs to be specified)
        #configurePhase = ''
	#  mkdir build
 	#  cd build
	#  ../configure --enable-vhpi --disable-lto --prefix="$out"
	#'';

        nativeBuildInputs = with pkgs; [
	  autoreconfHook
	  check
	  elfutils
	  flex
	  libffi
	  pkg-config
	  llvm
	  which
	  zlib
	  zstd
        ];

	doCheck = true;
      };

  defaultPackage.x86_64-linux = self.packages.x86_64-linux.nvc;
  };
}

