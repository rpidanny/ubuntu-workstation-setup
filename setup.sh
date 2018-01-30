#!/bin/bash

# updating apt-get
echo "Updating apt-get"
sudo apt-get update && sudo apt-get upgrade

# install git, curl, nmap
echo "Installing apps"
sudo apt-get install -y git git-core curl zsh nmap htop iftop \
ubuntu-restricted-extras gimp vlc browser-plugin-vlc vim \
libappindicator1 fonts-powerline dconf-cli diodon pylint python-pip python3-pip

# update pip
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip

# install virtual env
echo "Installing python virtual environment"
sudo pip install virtualenv && sudo pip3 install virtualenv

# install nodejs
echo "Installing node.js"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# installing eslint, http-server
sudo npm i -g eslint http-server

# download chrome
echo "Downloading Chrome"
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# install chrome
echo "Installing Chrome"
sudo dpkg -i google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb

# downloading skype
echo "Downloading Skype"
wget -c https://repo.skype.com/latest/skypeforlinux-64.deb

# install skype
echo "Installing Skype"
sudo dpkg -i skypeforlinux-64.deb && rm skypeforlinux-64.deb

# installing oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)