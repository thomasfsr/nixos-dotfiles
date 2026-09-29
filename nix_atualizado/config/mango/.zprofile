if [[ -z $WAYLAND_DISPLAY && -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
  exec mango
fi
