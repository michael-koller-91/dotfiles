#!/usr/bin/env bash

git clone git@github.com:michael-koller-91/kickstart.nvim.git ~/.config/nvim 
nvim --headless -c "MasonInstallAll" -c "TSUpdate" -c "quitall"
