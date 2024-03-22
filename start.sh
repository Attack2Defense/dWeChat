#!/bin/bash

rm -f /tmp/.X0-lock
/usr/bin/Xvfb :0 -screen 0 1280x960x24 -nolisten unix -ac +extension GLX +extension RENDER &
export DISPLAY=:0

mkdir /root/wxbot/.vnc/
touch /root/wxbot/.vnc/passwd
x11vnc -storepasswd 123456 /root/wxbot/.vnc/passwd

export DISPLAY=:0 
x11vnc -forever -display :0 -rfbauth  /root/wxbot/.vnc/passwd &
wechat