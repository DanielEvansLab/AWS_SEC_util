#!/bin/bash

#create bin and results dirs in home
if [ -d "$HOME/bin" ]; then
  echo "$HOME/bin exists"
else
  mkdir $HOME/bin
fi

if [ -d "$HOME/results" ]; then
  echo "$HOME/results exists"
else
  mkdir $HOME/results
fi

# move existing bash profile to backup, copy new profile to home
mv ../.bash_profile ../.bash_profile_bak
cp .bash_profile ../

source $HOME/.bash_profile

sudo yum install tmux

