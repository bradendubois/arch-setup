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

- Unix OS (tested on Manjaro)
  - Should be an Arch-based OS as the installation for software relies on *[pacman](https://wiki.archlinux.org/index.php/pacman)* and *[pacaur](https://wiki.archlinux.org/index.php/AUR_helpers)*, though it could be reasonably modified to use apt-get or similar.
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

**AUR Packages**

- Add packages to be installed by adding the *package name* to the text file at ``software-install/aur_packages.txt``.
- Remove packages to be installed by removing the *package name* from the text file at ``software-install/aur_packages.txt``, **or** place a ``#`` in front of an entry to ignore it.

**CURL Packages**

- Add packages to be installed by adding the *URL* to the text file at ``software-install/curl_packages.txt``.
- Remove packages to be installed by removing the *URL* from the text file at ``software-install/curl_packages.txt``, **or** place a ``#`` in front of an entry to ignore it.