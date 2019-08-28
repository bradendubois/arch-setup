#!

# *************** Config Sourcing **************
#
# The following are defined in config.sh :
#
# $dotBackupDir : This is the directory to back up old dotfiles to
# $backupTarget : This is the file to back up to $dotBackupDir
#
# announce : a helper function for pretty-fying text

source ./config.sh

# ensure script was copied correctly by checking that one argument was given
if [ $# != 1 ]
then
    announce "Incorrect number of arguments provided to $0"
    announce "Cannot proceed."
    
    exit 13
fi

# The target to backup
backupTarget=$@

# error - backup path exists and is not a directory
if [ -e ${dotBackupDir} ] && [ ! -d ${dotBackupDir} ]
then
    announce "${dotBackupDir} exists but is not a directory!"
    announce "Cannot backup files."
    announce "Please remove the file and run again."

    exit 5
fi

# backup directory doesn't exist
if [ ! -e ${dotBackupDir} ]
then
    announce "${dotBackupDir} will be created."

    mkdir $dotBackupDir

    if [ $? != 0 ]
    then
        announce "Failed to create ${dotBackupDir}, cannot proceed."
        exit 10
    else
        announce "${dotBackupDir} successfully created."
    fi
fi

# TODO - Detect if the directory already has rwx permissions

# add permissions to the backup directory
chmod u+rwx $dotBackupDir

if [ $? != 0 ]
then
    announce "Failed to give necessary permissions to ${dotBackupDir}"
    announce "Please add rwx permissions to $dotBackupDir and run again."

    exit 15
fi

# backup directory exists and is a directory and has permissions to rwx
announce "Backing up old ${backupTarget}."

if [ -e $dotBackupDir/$backupTarget ]
then
    announce "Replacing old backup of ${backupTarget}"
    sudo rm -rf $dotBackupDir/$backupTarget
fi

if [ -d $backupTarget ]
then
    cp -r $backupTarget $dotBackupDir
else
    cp $backupTarget $dotBackupDir
fi

if [ $? == 0 ]
then
    announce "${backupTarget} successfully backed up to ${dotBackupDir}"
else
    announce "Unexpected error; could not back up ${backupTarget} to ${dotBackupDir}"
    exit 25
fi
