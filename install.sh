#!/bin/sh
make clean
make
sudo make install
mkdir -p $HOME/.config/rsxiv/
[ -L $HOME/.config/rsxiv/exec ] || ln -s $(pwd)/exec $HOME/.config/rsxiv/exec
