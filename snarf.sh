#!/bin/sh
# Snarf a file or the output of a command into the
# X11 paste buffer using xclip(1).

if [ -z $1 ]; then
  name=`basename $0`
  echo "Usage: $name [command] <arg1> ... <argN>, or"
  echo " $name [file]"
  exit 1
fi

if [ -f $1 ]; then
  xclip -selection clipboard < $1
else
  "${@:1}" | xclip -selection clipboard
fi
