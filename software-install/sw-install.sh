#!

# AUR packages

if [ ! -e ./software-install/aur_packages.txt ]
then
  echo "No aur_packages.txt file found, no AUR packages will be installed"
elif [ ! -f ./software-install/aur_packages.txt ]
then
  echo "aur_packages.txt is not a file, no AUR packages will be installed"
else
  # First, check if pacaur is installed, as it can be run without root
  pacman -Qi pacaur
  if [ $? != 0 ]
  then
    # first, pacaur
    echo "Installing pacaur."
    sudo pacman -S pacaur
  fi

  # Now, can install all packages using pacaur.
  while read package;
  do

    # Ignores empty spots / comments
    if [[ ${package::1} != "#" && ${package::1} != "" ]]; 
    then

      # Ensure $package is not already installed
      pacaur -Qi $package > /dev/null
      if [ $? != 0 ]
      then

        echo "Searching for $package"
        pacaur -S --noconfirm $package;

        # Ensure $package is found/exists
        if [ $? != 0 ]
        then
          echo "$package was not found or failed to install."
        fi  
      else
        echo "$package is already installed."
      fi
    fi
  done < ./software-install/aur_packages.txt;
fi;

# CURL packages

if [ ! -e ./software-install/curl_packages.txt ]
then
  echo "No curl_packages.txt file found, no CURL packages will be installed"
elif [ ! -f ./software-install/curl_packages.txt ]
then
  echo "curl_packages.txt is not a file, no CURL packages will be installed"
else

  # First, check if curl is installed, as it can be run without root
  pacaur -Qi curl
  if [ $? != 0 ]
  then
    echo "Installing pacaur."
    # first, curl
    pacaur -S curl
  fi

  while read package;
  do
    # Ignore empty spots / comments
    if [[ ${package::1} != "#" && ${package::1} != "" ]]; 
    then
      sh -c "$(curl -fsSL $package)";
    fi
  done < ./software-install/curl_packages.txt;
fi;

exit 0
