#!/bin/bash

PICTURE=/home/kgosi/Pictures/wall1.jpg
#SCREENSHOT="grim $PICTURE"

BLUR="5x4"

#$SCREENSHOT
convert $PICTURE -blur $BLUR $PICTURE
swaylock -i $PICTURE
#rm $PICTURE
