#!

# Used to allow the relative paths to work if the working directory is not
# the root of this project when run
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
cd $scriptDir

# *************** Config Sourcing **************
#
# The following are defined in config.sh :
#
# $softwareInstallerPath
# $dotfileInstallerPath
#
# announce : a helper function for pretty-fying text

source ./config.sh

# ***************** Functions ****************

# These functions are helper/wrappers for the software and dotfile
#   installation, to indicate error codes that are returned by the files 

software_install() 
{
    sh $softwareInstallerPath
    ex=$?

    if [ ex != 0 ]
    then
        exit ${ex}
    fi
}

dotfile_install() 
{
    sh $dotfileInstallerPath
    ex=$?

    if [ ex != 0 ]
    then
        exit ${ex}
    fi
}

# ***********************************************

options=(
    "All"
    "Software Installs"
    "Dotfile Installs"
    "Exit"
)

announce "Choose an option for installation."

select option in "${options[@]}"
do
    case $option in

        "All")
            announce "\nInstalling all."
            software_install
            dotfile_install
            break;;

        "Software Installs")
            announce "\nInstalling software."
            software_install
            break;;

        "Dotfile Installs")
            announce "\nInstalling dotfiles."
            dotfile_install
            break;;

        "Exit")
            announce "\nNo action, exiting."
            exit;;

        *) echo "Invalid option!";;
    esac
done

if [ $? == 0 ]
then
    announce "Completed."
else
    announce "Completed with errors."
fi
