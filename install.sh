#!

color='\033[1;34m'
noColor='\033[0m'

# ************* Software Install *************

# Script used to install all software
#./software-install/sw-install.sh

printf "${color}Choose an option for installation.${noColor}\n"

options=("All" "Software Installs" "Dotfile Installs" "Exit")

select option in "${options[@]}"
do
    case $option in
        "All")
            echo "Installing all."
            ./installer-scripts/sw_installer.sh
            ./installer-scripts/dotfile_installer.sh
            break;;
        "Software Installs")
            echo "Installing software."
            ./installer-scripts/sw_installer.sh
            break;;
        "Dotfile Installs")
            echo "Installing dotfiles."
            pwd
            ./installer-scripts/dotfile_installer.sh
            break;;
        "Exit")
            echo "No action, exiting."
            exit;;
        *) echo "Invalid option!";;
    esac
done

printf "${color}Complete.${noColor}\n"