#!

# *************** Config Sourcing **************
#
# The following are defined in config.sh :
#
# $symlink_set : This is the set of dotfiles that are to be symlinked 
#   to the user's home folder.
# $dotfileDirectoryPath : This is the directory of the dotfiles folder 
#   that contains the new dotfiles to be added and symlinked to ~. 
#   The entire folder is copied to the root of the user's home folder, 
#   and the relevant dotfiles are symlinked to ~.
#
# announce : a helper function for pretty-fying text

source ./config.sh

if [ -e ~/.dotfiles ]
then
    announce "Unexpected error! ~/.dotfiles exists, but it should not."
    announce "Please remove ~/.dotfiles and run again."

    exit 37
fi

announce "Copying new dotfiles to ~/.dotfiles"
cp -r $dotfileDirectoryPath ~/.dotfiles

for file in ${symlink_set[@]}
do
    announce "Symlinking ${file} to ~"
    sudo ln -sv ~/.dotfiles/$file ~

    if [ $? == 0 ]
    then
        announce "Symlink successful."
    else
        announce "Unexpected error in symlinking."
        exit 43
    fi
done