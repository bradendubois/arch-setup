#!

# AUR packages

# Detect if there is no file
if [ ! -e ./software-install/aur_packages.txt ]
then
  ls .;
  echo "No aur_packages.txt file found, no AUR packages will be installed"
# Detect if it is not a file (possibly a directory)
elif [ ! -f ./software-install/aur_packages.txt ]
then
  echo "aur_packages.txt is not a file, no AUR packages will be installed"
# Install all AUR packages
else
while read package;
do
    if [[ ${package::1} != "#" && ${package::1} != "" ]]; # Ignore empty spots / comments
    then
        echo -S $package;
    fi
done < ./software-install/aur_packages.txt;
fi;

# CURL packages

# Detect if there is no file
if [ ! -e ./software-install/curl_packages.txt ]
then
  echo "No curl_packages.txt file found, no CURL packages will be installed"
# Detect if it is not a file (possibly a directory)
elif [ ! -f ./software-install/curl_packages.txt ]
then
  echo "curl_packages.txt is not a file, no CURL packages will be installed"
# Install anything using CURL
else
while read package;
do
    if [[ ${package::1} != "#" && ${package::1} != "" ]]; # Ignore empty spots / comments
    then
        # echo -c "$(curl -fsSL $package)";
        echo "Hello"
    fi
done < ./software-install/curl_packages.txt;
fi;

exit 0
