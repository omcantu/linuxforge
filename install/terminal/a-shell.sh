#!/bin/bash

# Configure the bash shell using -omakub defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omakub/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/omakub/defaults/bash/shell

[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using -omakub defaults
cp ~/.local/share/omakub/configs/inputrc ~/.inputrc
