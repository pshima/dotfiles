#!/usr/bin/env bash
set -e

today=`date +%m.%d.%Y`

symlinks=(.tmux.conf .vimrc .zshrc)

# First we just want to check that we aren't going to clobber anything
for link in ${symlinks[@]}; do
  if [ -f $HOME/${link} ]; then
	echo "$HOME/${link} exists as a file, backing up to $link.$today"
	mv $HOME/${link} $HOME/${link}.${today}
  fi
  echo "Symlinking dotfiles ${link} to $HOME"
  # just double check if there is already an existing symlink
  if [ -L $HOME/${link} ]; then
    unlink $HOME/${link}
  fi
  ln -s "$HOME/dotfiles/${link}" "$HOME/${link}"
done

#lets run some basic prereqs/reminders
if [[ $SHELL != *"zsh"* ]]; then
  echo "Doesn't look like your shell is zsh, you may want to swap it"
  echo "ex, chsh -s /bin/zsh"
fi

which tmux
if [[ $? != 0 ]]; then
  echo "Doesn't look like tmux is installed, you should install it"
fi

if [[ ! -e ~/.vim/bundle/vundle/README.md ]]
  echo "Doesn't look like Vundle is installed, you should install it"
fi



