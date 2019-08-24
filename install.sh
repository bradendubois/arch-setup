#!

# ************* Software Install *************

# Script used to install all software
./software-install/sw-install.sh

# ************* Dotfiles Install *************

# .dotfiles exists and is a directory, must have a previous install
if [ -e ~/.dotfiles ] && [ -d ~/.dotfiles ]
then
    echo "Previous ~/.dotfiles directory already found!"
    echo "Do you wish to remove the old directory?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) echo "Deleting ~/.dotfiles"; sudo rm -rf ~/.dotfiles; break;;
            No ) exit;;
        esac
    done
fi
    
echo "Copying the dotfiles directory to ~/.dotfiles" 
cp -r ./dotfiles ~/.dotfiles

echo "Deleting old ~/.bash_profile file."
sudo rm -rf ~/.bash_profile

echo "Symlinking new ~/.bash_profile file: ~/.dotfiles/.bash_profile --> ~."
sudo ln -sv ~/.dotfiles/.bash_profile ~

echo "Deleting old ~/.bashrc file."
sudo rm -rf ~/.bashrc

echo "Symlinking new ~/.bashrc file: ~/.dotfiles/.bashrc --> ~."
sudo ln -sv ~/.dotfiles/.bashrc ~
