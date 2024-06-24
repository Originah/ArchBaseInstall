#!/bin/bash

# ----------------------------------------------------- 
# Test Working Directory isnt within Repo
# ----------------------------------------------------- 

if [[ "$(basename "$(pwd)" | tr '[:upper:]' '[:lower:]')" =~ ^archbaseinstall$ ]]; then
    echo " This is the Repository folder please run archbaseinstall.sh instead"
    exit
fi

# ----------------------------------------------------- 
# Test if Repo is Already Downloaded
# ----------------------------------------------------- 

if [[ -f $HOME/ArchBaseInstall ]]; then
    echo "Repository Already Exists Running Install Sript"
    cd $HOME/ArchBaseInstall
    exec ./archbaseinstall.sh
    exit
fi

# ----------------------------------------------------- 
# Install Git
# ----------------------------------------------------- 

echo "Installing git"
pacman -Sy --noconfirm git

# ----------------------------------------------------- 
# Clone Git Repo
# ----------------------------------------------------- 

echo "Cloning Install Scripts"
git clone https://github.com/Originah/ArchBaseInstall

# ----------------------------------------------------- 
# Install Git
# ----------------------------------------------------- 

echo "Running Install Script"
cd $HOME/ArchBaseInstall
exec ./archbaseinstall.sh

