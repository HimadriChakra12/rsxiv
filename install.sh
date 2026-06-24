make clean
sudo make install
sudo cp ./etc/rsxiv.desktop /usr/share/applications 
rm $HOME/.config/rsxiv
mkdir -p $HOME/.config/rsxiv/
ln -s $(pwd)/exec $HOME/.config/rsxiv/exec
