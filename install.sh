#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# create backup dir if not already exists
mkdir -p ~/.mo_bash/backups


if [ "${machine}" = "Mac" ]; then
  # backup ~/.bash_profile for mac then add the
  # content of the .bash_profile in this dir
  # to it
  cp ~/.bash_profile ~/.mo_bash/backups/.bash_profile
  cat ~/.mo_bash/.bash_profile >> ~/.bash_profile
elif [ "${machine}" = "Linux" ]; then
  # backup ~/.bashrc then add the content of
  # the .bashrc in this dir to it
  cp ~/.bashrc ~/.mo_bash/backups/.bashrc
  cat ~/.mo_bash/.bashrc >> ~/.bashrc
fi
