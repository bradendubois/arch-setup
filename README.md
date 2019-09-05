# configs

A collection of tools I use to set up my Arch-based (Manjaro) workspace for development as well as everyday use.

- Installation scripts for: 
  - My dotfiles
  - Software
    - AUR Packages
    - Downloads using CURL

## Scripts

These scripts are written to run in ``bash``, and work on an Arch-based distro, though I believe they could be modified for most other \*NIX platforms. 


### Requirements

- Arch-based OS (tested on Manjaro)
  - Should be an Arch-based OS as the installation for software relies on *[pacman](https://wiki.archlinux.org/index.php/pacman)* and *[pacaur](https://wiki.archlinux.org/index.php/AUR_helpers)* (by default), though it could be reasonably modified to use apt-get or similar.
- Internet connection (for software download/installation, though it is able to install dotfiles without a connection).

### Install / Run

Assuming your working directory is the root of ``configs``:

```bash
./install.sh
```

or
```bash
sh install.sh
```
or
```bash
. install.sh
```

### Configuration

**These are configurable from ``config.sh``**

#### Directories

- Backup Dotfile Directory
  - *$dotBackupDir*
  - This is the directory that dotfiles will be copied to if the user opts to backup old files.
  - **Default**: dotBackupDir=~/.old-dot-files

- New Dotfile Directory
  - *$dotfileDirectoryPath*
  - This is the directory that will be created and new dotfiles will be copied to, and later symlinked from.
  - **Default**: dotfileDirectoryPath=./dotfiles

#### Files

- Dotfiles to backup/delete
  - *$dotfile_set*
  - This is the set of files that *may* exist on the user's machine and will be backed up (if prompted) and deleted. 
  - **Default**: dotfile_set=( .bashrc .bash_profile .dotfiles )

- Dotfiles to install and symlink
  - *$symlink_set*
  - These are the dotfiles to symlink from `.dotfiles`, which will typically be installed at `~`, and the files will be symlinked to `~`. 
  - **Default**: symlink_set=( .bashrc .bash_profile )

#### Packages to Install

**Package Lists**

- *aur_list*=`$package_dir`/**aur_packages.txt**
- *curl_list*=`$package_dir`/**curl_packages.txt**
- *pip_list*=`$package_dir`/**pip_packages.txt**
~Where `$package_dir` by default is ./package_lists~

**AUR Packages**

- Add packages to be installed by adding the *package name* to the text file at ``$aur_list``.
- Remove packages to be installed by removing the *package name* from the text file at ``$aur_list``, **or** place a ``#`` in front of an entry to ignore it.

**CURL Packages**

- Add packages to be installed by adding the *URL* to the text file at ``$curl_list``.
- Remove packages to be installed by removing the *URL* from the text file at ``$curl_list``, **or** place a ``#`` in front of an entry to ignore it.

**PIP Packages**

- Add packages to be installed by adding the *pip package* to the text file at ``$pip_list``.
- Remove packages to be installed by removing the *pip package* from the text file at ``$pip_list``, **or** place a ``#`` in front of an entry to ignore it.

#### Preferences

- Preferred `pacman` wrapper
  - *$pacWrapper*
  - This is the preferred wrapper for pacman as it can be run without root. If the user wanted to simply use `pacman`, setting this *to* `pacman` would likely work.
  - **Default**: pacWrapper=pacaur

- Preferred color for formatting text
  - *$blue*
  - This is the preferred color for formatting/coloring text in the helper function ``announce``, which is located in ``config.sh``.
  - **Default**: blue='\033[1;34m'

