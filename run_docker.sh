#!/usr/bin/env bash
xhost local:root

# Define Docker volumes and environment variables
DOCKER_VOLUMES="
--volume="/tmp/.X11-unix:/tmp/.X11-unix" \
"

DOCKER_ENV_VARS="
--env="NVIDIA_DRIVER_CAPABILITIES=all" \
--env="DISPLAY=unix$DISPLAY" \
--env="QT_X11_NO_MITSHM=1" \
"
DOCKER_ARGS=${DOCKER_VOLUMES}" "${DOCKER_ENV_VARS}

# Run the command
docker run -it --rm --privileged --device=/dev/ttyACM0 --net=host --name=mycobot_base_ros $DOCKER_ARGS rohan132/mycobot_280:noetic bash
