#!/bin/bash

# PLACEHOLDER function: didn't have time to figure out where to store the
# Chrome profile icons b/c didn't want to store them in git; in the future,
# when I have storage for them I can use this method to deploy them
#
# The .gifs I have been using are my Gmail profile pics (hence -gmail.gif)
copy_chrome_icons() {
  for i in mm mackey
  do
    img_filename=chrome_${i}_profile-gmail.gif
    cp $img_filename ~/.local/share/applications/$img_filename
  done
}

