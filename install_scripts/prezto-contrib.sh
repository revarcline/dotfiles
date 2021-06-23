#!/bin/bash
# installs zprezto if missing, updates from main repo if present
if [ ! -d ~/.prezto-contrib ]; then
  git clone --recursive https://github.com/belak/prezto-contrib ~/.prezto-contrib
else
  cd ~/.prezto-contrib
  git pull --no-rebase
fi
