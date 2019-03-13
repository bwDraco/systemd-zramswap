#!/bin/sh
set -e
swapoff /dev/zram0
echo 1 > /sys/block/zram0/reset