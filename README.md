# LinuxOSXremap

## The Mission

Programmers should be focused on programming, not slowed down by superficial differences in an OS.

## Requirements
* Ubuntu 16.04?
* python2
* python3
* autocutsel (this will auto install)

## Features
* OSX/Lisp style keymaps (for the keys on the left, the keys on the right are not affected atm)
* OSX shortcuts for screenshot, while also retaining Ctrl-C termination behavior in bash
* OSX like auto copy for selected content in gnome-terminal

## Description

Remapping Linux, specifically just Ubuntu 16.04 for right now, to use OSX or Lisp style keymaps. The idea is to make all of my shortcut keys that I actually use on my OSX computers the exact same on Linux. It's a preference thing, some will like it and others won't care or understand the joys of not needing spider fingers.

This script requires python2 and python3. I have only tested this with Ubuntu 16.04 LTS.

## Planned features

Currently there are no other planned features. Some more testing needs to be done to make this script compatiable with other versions of ubuntu and/or compatiable with any DE, not just gnome. There are issues with using xkbcomp or xmodmap to accomplish the remap, so any requests to use either will be denied. If I use any method at all, that is more compatiable with any distro, it will be a modification to the x11org.conf file because it would not require 2 or more additional files and modifications to try and load and maintain it during a user session. There is a real bug that prevents the ability of keeping an xmodmap or xkbcomp in memory across a suspend, but only on the first login when using Ubuntu 16.04 and I am not sure how many other versions and distros that may affect

Other OSX and Linux users are welcomed and encouraged to submit their changes as well. I really do want to aim for keyboard parity with OSX on linux. If there are specific applications that are on both Linux and OSX with shortcuts that differ then I hope you will consider making an autokey file or something to help resolve that issue and submit it to me in a pull request. I will include it, even if it is just a comment under Issues I will review it and find a way to add those shortcuts, but only for that specific application.