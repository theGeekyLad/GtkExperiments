#!/bin/bash
# This script rotates the screen and touchscreen input 90 degrees each time it is called, 
# also disables the touchpad, and enables the virtual keyboard accordingly

# by Ruben Barkow: https://gist.github.com/rubo77/daa262e0229f6e398766

#### configuration
# find your Touchscreen and Touchpad device with `xinput`
# TouchscreenDevice='ELAN Touchscreen'
# TouchpadDevice='DLL07BE:01 06CB:7A13 Touchpad'

if [ "$1" = "--help"  ] || [ "$1" = "-h"  ] ; then
echo 'Usage: rotate-screen.sh [OPTION]'
echo
echo 'This script rotates the screen and touchscreen input 90 degrees each time it is called,' 
echo 'also disables the touchpad, and enables the virtual keyboard accordingly'
echo
echo Usage:
echo ' -h --help display this help'
echo ' -j (just horizontal) rotates the screen and touchscreen input only 180 degrees'
echo ' -n always rotates the screen back to normal'
exit 0
fi

# touchpadEnabled=$(xinput --list-props "$TouchpadDevice" | awk '/Device Enabled/{print $NF}')
if [ ! -z "$1" ]
then
    screenMatrix=$(xinput --list-props "$1" | awk '/Coordinate Transformation Matrix/{print $5$6$7$8$9$10$11$12$NF}')
fi

# Matrix for rotation
# ⎡ 1 0 0 ⎤
# ⎜ 0 1 0 ⎥
# ⎣ 0 0 1 ⎦
normal='1 0 0 0 1 0 0 0 1'
normal_float='1.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,1.000000'

#⎡ -1  0 1 ⎤
#⎜  0 -1 1 ⎥
#⎣  0  0 1 ⎦
inverted='-1 0 1 0 -1 1 0 0 1'
inverted_float='-1.000000,0.000000,1.000000,0.000000,-1.000000,1.000000,0.000000,0.000000,1.000000'

# 90° to the left 
# ⎡ 0 -1 1 ⎤
# ⎜ 1  0 0 ⎥
# ⎣ 0  0 1 ⎦
left='0 -1 1 1 0 0 0 0 1'
left_float='0.000000,-1.000000,1.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000'

# 90° to the right
#⎡  0 1 0 ⎤
#⎜ -1 0 1 ⎥
#⎣  0 0 1 ⎦
right='0 1 0 -1 0 1 0 0 1'

###########################################################################################################

# xrandr -o normal
if [ ! -z "$2" ]
then
    xinput set-prop "$2" 'Coordinate Transformation Matrix' $left
fi
if [ ! -z "$1" ]
then
    xinput set-prop "$1" 'Coordinate Transformation Matrix' $left
fi
if [ ! -z "$3" ]
then
    xrandr --output "$3" --rotate left
fi
# xinput disable "$TouchpadDevice"
# killall onboard