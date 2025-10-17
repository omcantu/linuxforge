#!/bin/bash

# Configure the bash shell using -linuxforge defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/linuxforge/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/linuxforge/defaults/bash/shell

[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using -linuxforge defaults
cp ~/.local/share/linuxforge/configs/inputrc ~/.inputrc
