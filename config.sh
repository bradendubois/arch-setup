#!

# *****************  Directories ****************

# default directory for where to back up old dotfiles to
# Can change to wherever is preferred, but if the directory already exists,
#   ensure that it does not contain files from dotfile_set (below), and that 
#   it has rwx permissions. 
dotBackupDir=~/.old-dot-files


# ****** Dotfile Managers ******

# Path to the directory containing dotfile managing scripts
#   for backing up, deleting, or installing old dotfiles that
#   are already on the user's machine, following the spec
#   for files to back up or delete as specified by dotfile_set  
dotManagerPath=./installer-scripts/dotfile-managers

# Path to each specific dotfile manager
backupScriptPath=$dotManagerPath/backup_old_dotfiles.sh
deleteScriptPath=$dotManagerPath/delete_old_dotfiles.sh
installScriptPath=$dotManagerPath/install_new_dotfiles.sh

# ******************************

# Path to the directory of the new dotfiles to install
dotfileDirectoryPath=./dotfiles

# *****************  Main Scripts ****************

# These are the paths to the scripts that manage the installation
#   of software and dotfile setup
softwareInstallerPath=./installer-scripts/software_installer.sh
dotfileInstallerPath=./installer-scripts/dotfile_installer.sh

# ****** Package Lists ******

# Directory containing the lists of packages for various package managers
package_dir=./package_lists

# AUR/CURL/pip package/url lists
aur_list=$package_dir/aur_packages.txt
curl_list=$package_dir/curl_packages.txt
pip_list=$package_dir/pip_packages.txt

# ******************************

# Preferred pacman wrapper
pacWrapper=pacaur

# *****************  File Sets ****************

# Dotfiles to backup/delete
# These are files that may exist on the user's machine, and will
#   be replaced later, so they may wish to be backed up. These are
#   assumed to be in the user's home (~) directory.
dotfile_set=(
    .bashrc
    .bash_profile
    .dotfiles
)

# Dotfiles to symlink from .dotfiles/
# These files are included in dotfiles and will be symlinked to the
#   user's home directory. 
symlink_set=(
    .bash_profile
    .bashrc    
)

# *****************  Nice Colors ****************

# A nice shade of blue for formatting text
blue='\033[1;34m'

# Disable any coloring
no_color='\033[0m'

# ***************** Functions ****************

# A helper function to print a string with colored text and a newline char
announce() {

    # TODO - This is a start to allow color specification beyond the default blue
    if [ $# == 2 ]
    then
        color=$2
    else
        color=$blue
    fi

    printf "${color}${1}${no_color}\n"
}