#!/bin/bash

# For Ubuntu only
# Tested only on 16.04

bashrc=/home/`whoami`/.bashrc
newbashrc=./.bashrc

# Install autocutsel if the package is not found
if ! which autocutsel > /dev/null; then
   echo -e "Autocutsel not found! Install? (y/n) \c"
   read
   if "$REPLY" = "y"; then
      sudo apt-get install autocutsel -y
   fi
fi

#Swapping Alt, Win and Ctrl keys to align with OSX - but the Ctrl key will act as the Super (Win) key
gsettings set org.gnome.desktop.input-sources xkb-options "['altwin:ctrl_win', 'ctrl:swap_lalt_lctl_lwin']"

#Adding python script to enable autocopy on gnome-terminal
cp autocopy.py ~/.autocopy.py

# 1. Initiating python script from bashrc
# 2. Reset the termination shortcut from Ctrl-C to Ctrl-X, Ctrl-C cannot be mapped to from the Super (Win) key
# Note: When we add keyboard shortcuts Super-C will effectively be Ctrl-C on your physical keyboard
sed -i -e "s/user/`whoami`/g" ./.bashrc
if [ `fgrep -x -f ~/.bashrc .bashrc | wc -l` -ne 7 ]; then
	cat "$newbashrc" >> "$bashrc"
fi

# Dump the current keyboard shortcuts
dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ >~/.config/dconf/keybindings

# Add Ctrl-C termination behavior via shortcut for Super-C
if [[ ! `grep 'Control C' ~/.config/dconf/keybindings` ]]; then
	python3 shortcuts.py 'Control C' 'xte "keydown Control_L" "key x" "keyup Control_L" "keydown Control_L" "key c" "keyup Control_L"' '<Super>C'
fi
# Added screen region screenshot shortcut that matches OSX
if [[ ! `grep 'Take a screenshot of area' ~/.config/dconf/keybindings` ]]; then
	python3 shortcuts.py 'Take a screenshot of area' 'gnome-screenshot -a' '<Shift><Ctrl>4'
fi

read -p 'The script has installed OSX keymaps, and the autocopy python script. Press any key to finish...'