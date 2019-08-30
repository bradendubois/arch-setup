#!

# *************** Config Sourcing **************
#
# The following are defined in config.sh :
#
# $dotfile_set : the set of files on the user's machine to backup
#   and delete
#
# These are the paths to the scripts that
#   backup (if requested) -> delete -> install & symlink
# the relevant dotfiles
#   $backupScriptPath
#   $deleteScriptPath
#   $installScriptPath
#
# $dotfileDirectoryPath
#
# announce : a helper function for pretty-fying text

source ./config.sh

# *************** Backup Dotfiles ***************

for file in ${dotfile_set[@]}
do
    
    if [ -e ~/$file ]
    then
        announce "\nPrevious ~/${file} found! Would you like to back it up?"
        printf "~/${file} is a "

        if [ -f ~/$file ]
        then
            announce "file"
        elif [ -d ~/$file ]
        then
            announce "directory."
        fi

        select opt in "Yes" "No"
        do
            case $opt in
                "Yes" )
                    sh $backupScriptPath $file

                    ex=$?
                    
                    if [ $ex != 0 ]
                    then
                        announce "\nBackup failed! Exiting with error code ${ex}."
                        exit ${ex}
                    fi

                    break;;
                "No" )
                    announce "Skipping ~/${file}"
                    break;;
                * )
                    announce "\nInvalid selection!"
            esac
        done
    else
        announce "\n${file} Not found."
    fi
done

# ************* Delete Old Dotfiles *************

announce "\nDeleting the following files:"

for file in "${dotfile_set[@]}"
do
    if [ -d ~/$file ]
    then
        printf "Directory: "
    elif [ -f ~/$file ]
    then
        printf "File: "
    fi

    echo ~/$file
done

announce "\nPlease confirm: [Yes/No]"
select opt in "Yes" "No"
do
    case $opt in
        "Yes" )
            announce "Deleting old dotfiles."
            
            for file in "${dotfile_set[@]}"
            do
    
                sh $deleteScriptPath ~/$file

                ex=$?

                if [ $ex != 0 ]
                then
                    announce "Unexpected error in deleting ${file}."
                    announce "Exiting with error code ${ex}."
                    exit ${ex}
                fi
            done                
            break;;

        "No" )
            
            announce "Not deleting; exiting."
            exit;;

        * )
            announce "Invalid selection!"
    esac
done

# ************ Install New Dotfiles ************

announce "Installing and symlinking new dotfiles."
sh $installScriptPath

ex=$?

if [ $ex != 0 ]
then
    announce "Unexpected error in installation!"
    announce "Exiting with error code ${ex}."
    exit ${ex}
fi

# **********************************************

announce "Dotfile installation complete."