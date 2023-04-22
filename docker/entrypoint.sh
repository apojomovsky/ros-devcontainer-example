#!/usr/bin/env bash

# Change permissions of serial USB devices
[ -e /dev/ttyUSB0 ] && sudo chmod a+rw /dev/ttyUSB0
[ -e /dev/ttyUSB1 ] && sudo chmod a+rw /dev/ttyUSB1

# Source the ROS Noetic environment
source /opt/ros/noetic/setup.bash

# Update rosdep dependencies
sudo apt update
rosdep init && rosdep fix-permissions && rosdep update

# Install project dependencies
cd /home/dev/ros_ws/ && rosdep install -y --ignore-src --from-paths src

# Execute any arguments passed to this script
exec "$@"
