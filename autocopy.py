#!/usr/bin/env python
# -*- coding: utf-8 -*-

try:
    # Python2
    import Tkinter as tk
except ImportError:
    # Python3
    import tkinter as tk

root = tk.Tk()
# keep the window from showing
root.withdraw()

import os, sys
import subprocess

from Xlib import display, X, Xatom
import time

def paste(str, p=True, c=True):
    from subprocess import Popen, PIPE

    if p:
        p = Popen(['xsel', '-pi'], stdin=PIPE)
        p.communicate(input=str)
    if c:
        p = Popen(['xsel', '-bi'], stdin=PIPE)
        p.communicate(input=str)

#    os.popen('autocutsel &')
#    os.popen('autocutsel -s PRIMARY &')

class X11WinWatch:
    def __init__(self):
        self.display = display.Display()
        self.root = self.display.screen().root
        self.root.change_attributes(event_mask=(X.PropertyChangeMask))
        self.ACTIVE = self .display.intern_atom("_NET_ACTIVE_WINDOW")
        self.display.flush()

        self.activeWindow = self.root.get_full_property(self.ACTIVE, 0).value[0]
        self.doActiveWindow()
        self.run()
        
    def doActiveWindow(self):

        active = self.root.get_full_property(self.ACTIVE, 0).value[0]
        cmd = "cat /proc/$(xdotool getwindowpid " + str(active) + ")/comm"
        cmd2 = "cat /proc/$(xdotool getwindowpid " + str(self.activeWindow) + ")/comm"
        if active != self.activeWindow:
            self.activeWindow = active
            name = os.popen(cmd).read().strip()
            oldName = os.popen(cmd2).read().strip()
            print '%s' % name
            if name == 'gnome-terminal-':
                os.popen('autocutsel &')
                os.popen('autocutsel -s PRIMARY &')
            else:
                #oldName == 'gnome-terminal-':
                # read the clipboard
                try:
                     c = root.clipboard_get()
                     #os.popen('killall autocutsel')
                     paste(c, False)
                except:
                     print 'clipboard empty'
                os.popen('killall autocutsel')
    def run(self):
        while 1:
            while self.display.pending_events():
                e = self.display.next_event()
                if e.type == X.PropertyNotify:
                    self.doActiveWindow()                    
            time.sleep(0.1)

X11WinWatch()
