#!/bin/bash
# installs tmux plugin manager if missing, updates from main repo if present
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  cd ~/.tmux/plugins/tpm
  git pull --no-rebase
fi

