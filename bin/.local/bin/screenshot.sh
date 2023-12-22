#!/bin/sh

scrot -zq 100 -s - | xclip -selection clipboard -t image/png
