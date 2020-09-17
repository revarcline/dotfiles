#!/bin/bash
# installs zprezto if missing, updates from main repo if present
if [ ! -d ~/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
else
  cd ~/.zprezto
  git pull --no-rebase
fi
