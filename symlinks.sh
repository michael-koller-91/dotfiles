#!/usr/bin/env bash

# run this script as sudo

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

ln -fs $PWD/gid.sh $USER_HOME/gid.sh
ln -fs $PWD/gitconfig $USER_HOME/.gitconfig
ln -fs $PWD/i3config $USER_HOME/.config/i3/config
ln -fs $PWD/zshrc $USER_HOME/.zshrc
ln -fs $(which fdfind) /usr/local/bin/fd
