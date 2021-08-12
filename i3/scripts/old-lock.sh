#!/usr/bin/env bash

FILE=~/lock/current.png
if [ -f "$FILE" ]; then
  rm "$FILE"
  scrot -d 2 $FILE
  betterlockscreen -u $FILE
  betterlockscreen -l blur
else
  scrot -d 2 $FILE
  betterlockscreen -u $FILE
  betterlockscreen -l blur
fi
