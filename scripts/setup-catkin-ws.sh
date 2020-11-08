#!/bin/bash

# Make a Mission 9 repo directory
# This will be mapped to the host machine's src folder
# when starting a Docker container
mkdir -p /mission9/workspace/src
touch /mission9/workspace/.catkin_workspace

# Clone and Install PX4 Avoidance as a package in our workspace src
cd /mission9/workspace/src
git clone --depth 1 https://github.com/PX4/avoidance
# Use hash from 22 Sept 2020
cd avoidance && git checkout 8a957267c59282d689133f1b29057a79de335020

# Make the catkin workspace; source ROS to use catkin
source /opt/ros/melodic/setup.bash
cd /mission9/workspace
catkin build
# For less resource usage in case of issues building image:
# catkin build -j2 --mem-limit 75%
# TODO Necessary?
# source /mission9/workspace/devel/setup.bash