#!/bin/bash

_NODEJS_BIN="$1"

if [[ $# -eq 0 ]]; then
  _NODEJS_BIN=node
fi

_CODE=$(zenity --text-info --editable --height=200 --width=600 --title="JavaScript Code Input (Node.js $($_NODEJS_BIN -v))")

_STRING=\`$($_NODEJS_BIN -p "{ $_CODE }" 2>&1)\`

_OUTPUT=$($_NODEJS_BIN -p "$(echo "$_STRING").replace(/\nundefined$/g, '')")

echo "$_OUTPUT" | zenity --text-info --height=500 --width=600 --title="Output"
