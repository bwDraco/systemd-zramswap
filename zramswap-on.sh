#!/bin/sh
set -e
modprobe -v zram
echo 1G > /sys/block/zram0/disksize
mkswap /dev/zram0
swapon -d /dev/zram0