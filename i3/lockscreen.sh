#!/usr/bin/env sh

image=$1

convert $image RGB:- -charcoal 3 | i3lock --raw
