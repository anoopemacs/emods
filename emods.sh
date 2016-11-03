# script found from http://www.reddit.com/r/i3wm/comments/2dwq4m/issue_with_script_that_remaps_both_capslock_and/
 
#!/bin/sh
# depends xmodmap xcape
# https://github.com/alols/xcape
 
# clear all mappings
setxkbmap -option ''
xmodmap -e 'clear Lock'
#######################################################
# assign caps to control_left
xmodmap -e 'keycode 66 = Control_L'
xmodmap -e 'add Control = Control_L'
# make a fake escape key (so we can map it with xcape)
xmodmap -e 'keycode 999 = Escape'
xcape -e 'Control_L=Escape'
########################################################
# assign return to control on press, return on release
xmodmap -e 'keycode 36 = 0x1234'
xmodmap -e 'add Control = 0x1234'
# make a fake return key (so we can map it with xcape)
xmodmap -e 'keycode any = Return'
xcape -e '0x1234=Return'
########################################################
# mouse for left handed use
xmodmap -e "pointer = 3 2 1"
########################################################
# disable beep sounds when in x
xset b 0
########################################################
#headphone enable freebsd, remove this line for other OS
#sudo sysctl hw.snd.default_unit=2
# to do:
# set right click key to windows key? what if I change to different window manager
# set corner control keys to something useful
# try to get other natural 4000 extra keys to work
# try to get chrome and set new shortcuts for something like firemacs for chrome

