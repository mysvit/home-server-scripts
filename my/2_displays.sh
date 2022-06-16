#!/bin/sh
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 3840x0 --rotate normal
