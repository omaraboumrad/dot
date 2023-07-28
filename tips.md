## Activate USB Tethering

```
sudo ip link set dev usb0 up && dhclient usb0
```

## Setup additional monitors

```
xrandr --output DP-1 --mode 2560x1440 --rate 144.0
xrandr --output DP-2 --mode 1920x1080 --left-of DP-1 --rotate left --rate 144.0
xrandr --output DP-3 --mode 1920x1080 --right-of DP-1 --rotate right --rate 144.0
```

## VPN Up/Down

```
nmcli c up CON --ask
nmcli c down CON
```

## Fixing dpi after nvidia driver

add `20-nvidia-dpi.conf` to /etc/X11/xorg.conf.d
