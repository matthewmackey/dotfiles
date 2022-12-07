#!/usr/bin/env bash

#-------------------------------------------------------------------------------
# Taken pretty much w/o modification from (there was no licensing on the git
# repo it was from).
#
#  - https://github.com/ArtiomSu/kensington-expert-trackball-linux-config/blob/master/Kensington_Expert_Setup.sh
#  - (YouTube) https://www.youtube.com/watch?v=hIAJ9Icq3KU
#
# See also: https://askubuntu.com/questions/492744/how-do-i-automatically-remap-buttons-on-my-mouse-at-startup
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Default Properties for my Kensington
#
# :! xinput list-props 25
#-------------------------------------------------------------------------------
# Device 'Kensington Expert Wireless TB Mouse':
#         Device Enabled (187):   1
#         Coordinate Transformation Matrix (189): 1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
#         libinput Natural Scrolling Enabled (322):       0
#         libinput Natural Scrolling Enabled Default (323):       0
#         libinput Scroll Methods Available (324):        0, 0, 1
#         libinput Scroll Method Enabled (325):   0, 0, 0
#         libinput Scroll Method Enabled Default (326):   0, 0, 0
#         libinput Button Scrolling Button (327): 2
#         libinput Button Scrolling Button Default (328): 2
#         libinput Middle Emulation Enabled (329):        1
#         libinput Middle Emulation Enabled Default (330):        0
#         libinput Accel Speed (331):     0.978992
#         libinput Accel Speed Default (332):     0.000000
#         libinput Accel Profiles Available (333):        1, 1
#         libinput Accel Profile Enabled (334):   1, 0
#         libinput Accel Profile Enabled Default (335):   1, 0
#         libinput Left Handed Enabled (336):     0
#         libinput Left Handed Enabled Default (337):     0
#         libinput Send Events Modes Available (307):     1, 0
#         libinput Send Events Mode Enabled (308):        0, 0
#         libinput Send Events Mode Enabled Default (309):        0, 0
#         Device Node (310):      "/dev/input/event22"
#         Device Product ID (311):        1149, 32792
#         libinput Drag Lock Buttons (338):       <no items>
#         libinput Horizontal Scroll Enabled (339):       1

mouse_name="Kensington Expert Wireless TB Mouse"

check=$(xinput | grep "$mouse_name")

if [[ -n "$check" ]]; then
  mouse_id=$(xinput | grep "$mouse_name" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/')

  # swap right and back button then swap middle and back button
  xinput set-button-map $mouse_id 1 8 2 4 5 6 7 3 9

  # Disable natural scrolling -> this means we roll down to scroll down and roll up to scroll up.
  xinput set-prop $mouse_id "libinput Natural Scrolling Enabled" 0

  # disable acceleration for the ball
  xinput set-prop $mouse_id "libinput Accel Profile Enabled" 0, 1

  # allow scrolling by holding middle mouse button and using the ball to scroll ( really smooth and fast ). 
  xinput set-prop $mouse_id "libinput Scroll Method Enabled" 0, 0, 1

  # allow the remmaped middle mouse to be used for middle mouse scroll
  xinput set-prop $mouse_id "libinput Button Scrolling Button" 3
fi
