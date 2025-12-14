# install a font

* download the .zip
* `unzip <Font>.zip -d ~/.fonts`
* `fc-cache -fv`

# install Rust

```bash
curl https://sh.rustup.rs -sSf > rust_init.sh
chmod +x rust_init.sh
./rust_init.sh --no-modify-path
```

# useful `nix` commands

```sh
nix flake update
sudo nixos-rebuild switch --flake .
home-manager switch --flake .

ls /nix/var/nix/profiles
sudo nix-env -p /nix/var/nix/profiles/system --delete-generations <number>

nix store delete /nix/store/hash
nix-collect-garbage -d

# get the hash
nix flake prefetch github:<owner>/<repo>/<ref>
```
