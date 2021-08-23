#!/usr/bin/bash

# Use xrandr to see list of monitors
CHECKMON=$(xrandr --listmonitors)
# List all xrandr properties to see if mode already exists
CHECKMODES=$(xrandr)
# Path to log file
LOGS='/home/altus/.logs/xrandr/logs.txt'
# Use for debugging in local folder
# LOGS='test.txt'
# time of log
time=$(date +%R)
# Date of log
date=$(date -I) # format: yyyy/mm/dd
# Modenames
modename1="extended"
modename2="large"

# Check to see what the hdmi connection is named
detectExternal () {
  if echo $CHECKMON | grep -q 'HDMI-1-1'; then 
    local mon="HDMI-1-1"
    echo "$mon"
  elif echo $CHECKMON | grep -q 'HDMI-1'; then
    local mon="HDMI-1"
    echo "$mon"
  fi
}
# set the monitor var for use in next fuctions
MONITOR="$(detectExternal)"


# check if mode already exists if not add with xrandr
function confirmMode () {
  if  echo $CHECKMODES | grep -q "$1";then 
    # echo "=> Mode: "$1" already exists. For $MONITOR." >> ${LOGS}
    # echo Date: "$date --- Time: $time." >> ${LOGS}
    return 0
  else 
    xrandr --newmode $1 $2 
    xrandr --addmode $MONITOR $1
    echo "=> Mode: $1 mode added to $MONITOR." >> ${LOGS}
    echo Date: "$date --- Time: $time." >> ${LOGS} 
  fi
}


# 1368x768_60 same as laptop - good foe extended desktop
confirmMode $modename1 "85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync"
# 1600x900_60 larger than dektop good for games or better quality
confirmMode $modename2 "118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync"
