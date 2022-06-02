#!/bin/bash

_CODE=$(zenity --text-info --editable --height=200 --width=600 --title="JavaScript Code Input (Node.js $(node -v))")

_STRING=\`$(node -p "{ $_CODE }" 2>&1)\`

_OUTPUT=$(node -p "$(echo "$_STRING").replace(/\nundefined$/g, '')")

echo "$_OUTPUT" | zenity --text-info --height=500 --width=600 --title="Output"
