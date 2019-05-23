#!/bin/bash

# created by Ruben Barkow (@rubo77)
# modified by Rahul Pillai (@theGeekyLad)

# touchpadEnabled=$(xinput --list-props "$1" | awk '/Device Enabled/{print $NF}')
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
    xinput set-prop "$2" 'Coordinate Transformation Matrix' $normal
fi
if [ ! -z "$1" ]
then
    xinput set-prop "$1" 'Coordinate Transformation Matrix' $normal
fi
if [ ! -z "$3" ]
then
    xrandr --output "$3" --rotate inverted
fi
# xinput disable "$1"
# killall onboard