#!/bin/bash

# For Ubuntu only
# Tested only on 16.04

#Swapping Alt, Win and Ctrl keys to align with OSX - but the Ctrl key will act as the Super (Win) key
gsettings set org.gnome.desktop.input-sources xkb-options ['altwin:ctrl_win', 'ctrl:swap_lalt_lctl_lwin']

# Reset the termination shortcut from Ctrl-C to Ctrl-X, Ctrl-C cannot be mapped to from the Super (Win) key
# When we add keyboard shortcuts Super-C will effectively be Ctrl-C on your physical keyboard
# Add logic for checking for remap in .bashrc
# then add this if missing
#
# stty intr ^X

# Automate the keyboard shortcuts needed in Ubuntu
# file shortcuts.py
# python3 shortcuts.py 'Take a screenshot of area' 'gnome-screenshot -a' '<Shift><Ctrl>$'
# python3 shortcuts.py 'Control C' "xte 'keydown Control_L' 'key x' 'keyup Control_L' 'keydown Control_L' 'key c' 'keyup Control_L'" '<Super>C'

# Add more python code here to setup the auto copy selection feature in terminal to match OSX behavior
# file autocopy.py
# Add logic in .bashrc
# If gnome terminal has the focus python will run autocutsel
# else the script will copy the contents from autocutsel clipboard, kill autocutsel then place the data back into the clipboard
# Apparently the clipboard wipes itself out once autocutsel is killed, so python has to grab it first to put it back in
#
# if pgrep -f "python /home/{user}/autocopy.py" &>/dev/null; then
#     :
# else
#     nohup python ~/autocopy.py &> nohup.out &
# fi
