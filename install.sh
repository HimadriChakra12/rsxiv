make clean
make
sudo make install
sudo cp ./etc/rsxiv.desktop /usr/share/applications 
rm -rf $HOME/.config/rsxiv
mkdir -p $HOME/.config/rsxiv/
ln -s $(pwd)/exec $HOME/.config/rsxiv/exec
