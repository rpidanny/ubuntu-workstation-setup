#!/bin/bash

install_commons () {
  # updating apt-get
  echo "Updating apt-get"
  sudo apt-get update && sudo apt-get upgrade

  # install apps
  echo "Installing apps"
  sudo apt-get install -y git git-core curl zsh nmap htop iftop \
  vim python-pip python3-pip tmux

  # update pip
  echo "Upgrading pip"
  sudo pip install --upgrade pip
  sudo pip3 install --upgrade pip

  # install virtual env
  echo "Installing python virtual environment"
  sudo pip install virtualenv && sudo pip3 install virtualenv

  # install nodejs
  echo "Installing node.js"
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  sudo apt-get install -y nodejs

  # installing http-server
  sudo npm i -g http-server
}

install_desktop () {
  # install desktop apps
  echo "Installing Desktop Apps"
  sudo apt-get install -y ubuntu-restricted-extras gimp vlc browser-plugin-vlc \
  libappindicator1 dconf-cli diodon pylint qbittorrent

  # installing eslint
  sudo npm i -g eslint

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
}

restore_configs () {
  # installing oh-my-zsh
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # installing zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

  # installing zsh-syntax
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # Getting zsh config
  echo "Restoring .zshrc"
  wget https://raw.githubusercontent.com/rpidanny/dotfiles/master/.zshrc -O $HOME/.zshrc

  # Getting tmux config
  echo "Restoring .tmux.conf"
  wget https://raw.githubusercontent.com/rpidanny/dotfiles/master/.tmux.conf -O $HOME/.tmux.conf

  # Setting zsh as default
  echo "Setting zsh as default"
  chsh -s $(which zsh)

  # installing theme
  echo "Installing powerline theme"
  sudo apt-get install -y fonts-powerline
}

option="$1"

if [ $# -ne 1 ]; then
  printf "Usage: $0 <server/desktop>"
else
  case "$option" in
    "server") 
      install_commons
      restore_configs
      ;;
    "desktop")
      install_commons
      install_desktop
      restore_configs
      ;;
    *)  printf "Invalid argument!\nUsage: $0 <server/desktop>" >&2
        exit 1 ;;
  esac
fi