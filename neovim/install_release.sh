#!/usr/bin/env bash

mkdir downloads
wget -P downloads https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz
tar -xvzf downloads/nvim-linux-x86_64.tar.gz -C downloads
ln -s $PWD/downloads/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
rm -rf downloads/nvim-linux-x86_64.tar.gz
