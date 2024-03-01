#!/usr/bin/env bash

export DOTFILES_HOME="${HOME}/.dotfiles"
export OH__HOME="${HOME}/.dotfiles"
GIT_REPO=aleks-sidorenko/dotfiles
GIT_BRANCH=multios


if [ "$(uname)" = "Darwin" ]; then
    OS=mac
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    OS=linux
else
    echo "Your OS is not supported!"
fi

echo "Installing OS prerequiestics for $OS"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/$GIT_REPO/$GIT_BRANCH/os/$OS/install.sh)"

# Clone dotfiles
if [ ! -d "$DOTFILES_HOME" ]; then
    echo "Cloning dotfiles to $DOTFILES_HOME"
    git clone -b $GIT_BRANCH --recursive https://github.com/$GIT_REPO.git $DOTFILES_HOME
fi


# Install oh-my-zsh
if [ ! -d "$OZH" ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Sync dotfiles
echo "Syncing dotfiles"
dotfiles --sync -C $DOTFILES_HOME/dotfilesrc

# Symlink vs code settings since dotfiles doesn't support nested packages for now
#mkdir -p $HOME/.config/Code/User
#ln -s $HOME/.dotfiles/vscode/settings.json $HOME/.config/Code/User/settings.json

# Install vim & plugins
#sudo apt install -y vim
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
 #   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#vim +'PlugInstall --sync' +qa


# Install tmux & plugins
#sudo apt install -y tmux


# Tools
#sudo apt install -y htop iftop docker.io xclip
#sudo pip3 install thefuck

# SDK
#sudo apt install -y openjdk-11-jdk

# Python
#sudo apt install python3-pip
#pip3 install virtualenv
#pip3 install virtualenvwrapper

# Node
# NVM
#curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
#nvm install node 


# IDE
#sudo snap install code --classic
#sudo snap install intellij-idea-community --classic

# Messengers
#sudo snap install slack --classic
#sudo snap install viber-unofficial
#sudo snap install telegram-desktop

