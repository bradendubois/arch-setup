#!

color='\033[1;34m'
noColor='\033[0m'

# ************* Software Install *************

# Script used to install all software
./software-install/sw-install.sh

# ************* Dotfiles Install *************

# .dotfiles exists and is a directory, must have a previous install
if [ -e ~/.dotfiles ] && [ -d ~/.dotfiles ]
then
    printf "${color}Previous ~/.dotfiles directory already found!${noColor}\n"
    printf "${color}Do you wish to remove the old directory?${noColor}\n"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) echo "Deleting ~/.dotfiles"; sudo rm -rf ~/.dotfiles; break;;
            No ) exit;;
        esac
    done
fi
    
say "${color}Copying the dotfiles directory to ~/.dotfiles.${noColor}\n" 
cp -r ./dotfiles ~/.dotfiles

printf "${color}Deleting old ~/.bash_profile file.${noColor}\n"
sudo rm -rf ~/.bash_profile

printf "${color}Symlinking new .bash_profile file.${noColor}\n"
sudo ln -sv ~/.dotfiles/.bash_profile ~

printf "${color}Deleting old ~/.bashrc file.${noColor}\n"
sudo rm -rf ~/.bashrc

printf "${color}Symlinking new .bashrc file.${noColor}\n"
sudo ln -sv ~/.dotfiles/.bashrc ~
