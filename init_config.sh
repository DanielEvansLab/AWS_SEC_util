#!/bin/bash

#create bin dir in home to contain binaries
mkdir $HOME/bin
mkdir $HOME/results

# move existing bash profile to backup, copy new profile to home
mv ../.bash_profile ../.bash_profile_bak
cp .bash_profile ../

source $HOME/.bash_profile

sudo yum install tmux

