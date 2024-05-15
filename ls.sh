#!/bin/sh

ITERATIONS="5"

TRACKING_FILE="/path/to/bootloop.txt"
touch "$TRACKING_FILE"

N=$(cat "$TRACKING_FILE" | wc -c)

if [ "$N" -lt "$ITERATIONS" ]; then
    printf "." >> "$TRACKING_FILE"
    echo "rebooting (iteration $N)"
    # TODO: this is where you put the reboot command
    #       and anything you want to run before rebooting each time
else
    rm "$TRACKING_FILE"
    # TODO: other commands to resume anything required
fi
