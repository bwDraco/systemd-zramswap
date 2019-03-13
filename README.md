# systemd-zramswap

This is a simple systemd service that enables and disables zram swap. It, of course, assumes that the zram kernel module is available; the service will fail if it encounters an error at any point while creating the swap or enabling the swap space.

To use this service, place the service file into `/etc/systemd/system/` or `/usr/lib/systemd/system/`, depending on the specific Linux distribution (openSUSE uses the latter), and the two shell scripts into `/usr/local/sbin/` (see below if you prefer a different location). You can then run `systemctl {enable|disable|start|stop|restart} zramswap` as appropriate.

**Important security note:** The script files should have permission values 744 or 544, while the service file should have permission value 644 or 444, both should be owned by root. If they are writeable by any user other than root, an unprivileged user will be able to alter them to execute arbitrary code.

## Options

- **Size of zram swap:** By default, the size of the zram swap space is 1 GiB. This can be changed by editing the `echo 1G > /sys/block/zram0/disksize` line in the `zramswap-on.sh` file, replacing `1G` with the desired size. Valid suffixes include K, M, G, T, P, and E. Extremely large swap spaces likely will not work correctly; use a size that is appropriate to the amount of physical memory on your system.
- **Location of script files:** If you'd like to put the script files in a different directory, edit the `ExecStart` and `ExecStop` lines in `zramswap.service` to point to the actual location of the script files.
