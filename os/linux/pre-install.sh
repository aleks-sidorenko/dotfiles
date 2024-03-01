#!/usr/bin/env bash

# Install pre-requistics 
sudo apt update
sudo apt upgrade -qq
sudo apt install -qq -y curl wget git python3-pip zip unzip zsh

sudo pip3 install dotfiles

# Install powerline fonts https://github.com/i-tu/Hasklig
mkdir ~/.fonts
wget https://github.com/i-tu/Hasklig/releases/download/1.1/Hasklig-1.1.zip -O ~/.fonts/hasklig.zip
unzip -o ~/.fonts/hasklig.zip -d ~/.fonts
rm ~/.fonts/hasklig.zip


