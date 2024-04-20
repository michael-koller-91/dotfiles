#! /bin/bash

HOME_FILES=".gitconfig"

for f in $HOME_FILES
do
  chmod 644 "$(pwd)/$f"
  chown root:root "$(pwd)/$f"
  ln -sf "$(pwd)/$f" "${HOME}/$f"
  echo "Linked $f"
done

