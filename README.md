# dotfiles
My personal dotfiles for Ubuntu 18.04 LTS

## Installation
```
sudo pip install dotfiles
git clone --recursive https://github.com/aleks-sidorenko/dotfiles.git $HOME/.dotfiles
dotfiles --sync -C $HOME/.dotfiles/dotfilesrc
```

## Update
```
cd $HOME/.dotfiles
git pull
git submodule update --remote
```
