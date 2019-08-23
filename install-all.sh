#!

# Script used to install all software from the AUR
./software-install/sw-install.sh

# Copy the dotfiles to the home directory
sudo cp ./dotfiles ~

# Delete the old bash_profile file
sudo rm -rf ~/.bash_profile
# Symlink the new bash_profile
sudo ln -sv ~/.dotfiles/.bash_profile ~

# NOTE - This is done *after* oh-my-bash is installed

# Delete the old bashrc file
sudo rm -rf ~/.bashrc
# Symlink the new bashrc file
sudo ln -sv ~/.dotfiles/.bashrc ~
