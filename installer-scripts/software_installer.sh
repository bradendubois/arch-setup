#!

# *************** Config Sourcing **************
#
# The following are defined in config.sh :
#
# $pacWrapper : a wrapper for pacman; $pacWrapper by default
# $aur_list
# $curl_list
#
# announce : a helper function for pretty-fying text

source ./config.sh

# *************** AUR Packages **************

if [ ! -e $aur_list ]   # check if $aur_list exists
then
  announce "No aur_packages.txt file found, no AUR packages will be installed."
elif [ ! -f $aur_list ] # check if $aur_list is a file
then
  announce "aur_packages.txt is not a file, no AUR packages will be installed."
else
  # First, check if the package wrapper (default : pacaur) is installed, 
  #   as it can be run without root
  pacman -Qi $pacWrapper > /dev/null
  
  if [ $? != 0 ]    # Non-zero means the package wrapper is *not* installed
  then
    announce "Installing $pacWrapper."
    sudo pacman -S $pacWrapper

    if [ $? != 0 ]
    then
      announce "${pacWrapper} not installed, cannot continue package installation!"
      exit 81
    fi
  fi

  # Now, can install all packages using the package wrapper.
  while read package;
  do

    # Ignores empty spots / comments
    if [[ ${package::1} != "#" && ${package::1} != "" ]]; 
    then

      # Ensure $package is not already installed
      $pacWrapper -Qi $package > /dev/null
      
      if [ $? == 0 ]    # package is already installed
      then
        announce "$package is already installed, skipping."
      
      else
        announce "Searching for $package"
        $pacWrapper -S --noconfirm $package;

        # Ensure $package was found and installed
        if [ $? != 0 ]
        then
          announce "$package was not found or failed to install."
        fi  
      fi
    fi
  done < $aur_list
fi;

# *************** CURL Packages **************

if [ ! -e $curl_list ]    # check if $curl_list exists
then
  announce "No curl_packages.txt file found, no CURL packages will be installed"
elif [ ! -f $curl_list ]  # check if $curl_list is a file
then
  announce "curl_packages.txt is not a file, no CURL packages will be installed"
else
  # First, check if curl is installed, as it can be run without root
  $pacWrapper -Qi curl
  
  if [ $? != 0 ]
  then
    announce "Installing curl."
    $pacWrapper -S curl

    if [ $? != 0 ]
    then
      announce "CURL not installed, cannot continue CURL package installation!"
      exit 82
  fi

  while read package;
  do
    # Ignore empty spots / comments
    if [[ ${package::1} != "#" && ${package::1} != "" ]]; 
    then
      sh -c "$(curl -fsSL $package)";
    fi
  done < $curl_list
fi;
