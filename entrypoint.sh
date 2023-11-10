#!/bin/bash
# Basic entrypoint for ROS / Catkin Docker containers

# Source ROS and Catkin workspaces
source /opt/ros/noetic/setup.bash
if [ -f /mycobot_ws/devel/setup.bash ]
then
  echo "source /mycobot_ws/devel/setup.bash" >> ~/.bashrc
  source /mycobot_ws/devel/setup.bash
fi

# Execute the command passed into this entrypoint
exec "$@"