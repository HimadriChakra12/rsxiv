make clean
make
sudo make install-all
rm -rf $HOME/.config/rsxiv
mkdir -p $HOME/.config/rsxiv/
ln -s $(pwd)/exec $HOME/.config/rsxiv/exec
