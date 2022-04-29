#!/usr/bin/env bash
res=$(wmctrl -l |awk '{print $NF}'  |dmenu)
wmctrl -a ${res}
