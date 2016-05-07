#!/bin/bash

# For Ubuntu only
# Tested only on 16.04

#Swapping Alt, Win and Ctrl keys to align with OSX - but the Ctrl key will act as the Super (Win) key
gsettings set org.gnome.desktop.input-sources xkb-options ['altwin:ctrl_win', 'ctrl:swap_lalt_lctl_lwin']

# Resetting the termination shortcut from Ctrl-C to Ctrl-X, Ctrl-C cannot be mapped to from the Super (Win) key
stty intr ^X

# Add python code here later to automate the keyboard shortcuts needed in Ubuntu

# Add more python code here to setup the auto copy selection feature in terminal to match OSX behavior
