#!

# *************** Config Sourcing **************
#
# The following are defined in config.sh :
# 
# $deletionTarget : the file to delete
#
# announce : a helper function for pretty-fying text

source ./config.sh

# ensure script was copied correctly by checking that one argument was given
if [ $# != 0 ]
then
    announce "Incorrect number of arguments provided to $0"
    announce "Cannot proceed."
    
    exit 14
fi

# The target to backup when called
deletionTarget=${deletionTarget}

if [ ! -e ${deletionTarget} ]
then
    
    announce "${deletionTarget} not found, skipping."

else
    
    announce "Deleting ${deletionTarget}"
    sudo rm -rf ${deletionTarget}

    if [ $? != 0 ]
    then
        announce "Failed to delete ${deletionTarget}"
        announce "Cannot proceed."

        exit 28
    fi
fi
