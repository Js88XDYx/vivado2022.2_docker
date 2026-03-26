#!/bin/bash
PROJECT_PATH=${HOME}/ece385/
export DISPLAY=:0
xhost +local:docker
docker run -it --rm \
  --net host \
  -e LOCAL_UID=$(id -u ${USER}) \
  -e LOCAL_GID=$(id -g ${USER}) \
  -e USER=${USER} \
  -e UART_GROUP_ID=20 \
  -e DISPLAY=${DISPLAY} \
  -e "QT_X11_NO_MITSHM=1" \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v ${HOME}/.Xauthority:${HOME}/.Xauthority:rw \
  -v ${PROJECT_PATH}:${HOME}/projects:rw \
  -v /run/udev:/run/udev:ro \
  -v /dev:/dev:rw \
  -v /sys:/sys:ro \
  --device-cgroup-rule='c 166:* rmw' \
  --device-cgroup-rule='c 188:* rmw' \
  --device=/dev/bus/usb \
  --device=/dev/dri \
  -w ${HOME} \
  vivado:2022.2

# cgroup 166 for programming with Vivado
# cgroup 188 for Vitis serial monitor
