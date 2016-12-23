#!/bin/sh

#  uninstall.sh
#  AudioHub
#
#  Created by Daniel Lindenfelser on 11/09/15.
#  Copyright © 2015 Daniel Lindenfelser. All rights reserved.

COREAUDIOD_PLIST_PATH='/System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist'
DRIVER_PATH='/Library/Audio/Plug-Ins/HAL/AudioHub.driver'
PREFPANE_PATH='/Library/PreferencePanes/AudioHub.prefPane'

# Stop coreaudiod
printf "Stopping Core Audio Server... "
launchctl unload "${COREAUDIOD_PLIST_PATH}"
[ -z "$(launchctl list | grep coreaudiod)" ] && printf 'OK\n' || printf 'Error\n'

if [ -d "${DRIVER_PATH}" ]; then
    printf "Removing AudioHub Driver... "
    sudo rm -rf "${DRIVER_PATH}" > /dev/null
    [ ! -d "${DRIVER_PATH}" ] && printf "Done\n" || printf "Error\n"
fi

if [ -d "${PREFPANE_PATH}" ]; then
    printf "Removing AudioHub PreferencePane... "
    sudo rm -rf "${PREFPANE_PATH}" > /dev/null
    [ ! -d "${PREFPANE_PATH}" ] && printf "Done\n" || printf "Error\n"
fi

# Start coreaudiod
printf "Starting Core Audio Server... "
launchctl load "${COREAUDIOD_PLIST_PATH}"
[ ! -z "$(launchctl list | grep coreaudiod)" ] && printf 'OK\n' || printf 'Error\n'
