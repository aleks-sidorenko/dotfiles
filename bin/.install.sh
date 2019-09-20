#!/bin/bash

shopt -s expand_aliases
source ~/.bash_aliases

# updating to latest
update

# tools
sudo apt install -y htop iftop docker.io

# ides
sudo snap install code --classic
sudo snap install intellij-idea-community --classic

# messangers
sudo snap install viber-unofficial
sudo snap install telegram-desktop