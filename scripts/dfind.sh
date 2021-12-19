#!/usr/bin/env bash
res=$(wmctrl -l |awk '{print $NF}' |dmenu-wl)
wmctrl -a ${res}
