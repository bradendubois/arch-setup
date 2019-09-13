## configs Error Codes

| Error Code |            File             |          Reason          |
| :--------: | :-------------------------: | :----------------------- |
|   **5**    | ``backup_old_dotfiles.sh``  | The path to the backup directory exists, but it's not a directory; perhaps there is a file with name of the directory in its place? |
|   **10**   | ``backup_old_dotfiles.sh``  | The dotfile backup directory could not be created; perhaps there are not permissions to create a new directory? |
|   **13**   | ``backup_old_dotfiles.sh``  | More than one argument was provided, which should not happen; the file takes one argument per call, which is to be the file/directory to backup. |
|   **14**   | ``delete_old_dotfiles.sh``  | More than one argument was provided, which should not happen; the file takes one argument per call, which is to be the file/directory to delete. |
|   **15**   | ``backup_old_dotfiles.sh``  | Could not give `rwx` permissions to the backup directory so that files can be backed up? Try using `chmod` to give those permissions to your backup directory and try again. |
|   **25**   | ``backup_old_dotfiles.sh``  | Copying the file to backup directory failed; could be related to `rwx` permissions? Does the file already exist? |
|   **28**   | ``delete_old_dotfiles.sh``  | Deleting the old file/directory failed. Was it removed before deletion? Lack of permissions to delete something in this directory? |
|   **37**   | ``install_new_dotfiles.sh`` | The directory for the new dotfiles installation exists, though it should not as it should have been removed just prior. Did it get created between running ``delete_old_dotfiles.sh`` and ``install_new_dotfiles.sh``? |
|   **43**   | ``install_new_dotfiles.sh`` | There was an unexpected error in installing a file from the the new dotfiles directory to the user's home directory. Lack of permissions to symlink? |
|   **81**   | ``software_installer.sh``   | There was an error and a package wrapper for ``pacman`` failed to install. Did the machine lose internet connection? Did the user decline to install the wrapper when prompted? |
|   **82**   | ``software_installer.sh``   | There was an error and `CURL` failed to install. Did the machine lose internet connection? Did the user decline to install `CURL` when prompted? |
|   **83**   | ``software_installer.sh``   | There was an error and `pip` failed to install. Did the machine lose internet connection? Did the user decline to install `pip` when prompted? |
