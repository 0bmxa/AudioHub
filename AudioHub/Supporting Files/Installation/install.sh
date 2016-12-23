#!/bin/sh

#  install.sh
#  AudioHub
#
#  Created by Daniel Lindenfelser on 11/09/15.
#  Copyright © 2015 Daniel Lindenfelser. All rights reserved.

DSTROOT="/tmp/AudioHub.dst"
COREAUDIOD_PLIST_PATH='/System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist'
DRIVER_PATH='/Library/Audio/Plug-Ins/HAL/AudioHub.driver'
PREFPANE_PATH='/Library/PreferencePanes/AudioHub.prefPane'


# Require root
if [ $(id -u) != 0 ]; then
    echo 'This script needs to be run with root privileges.'
    exit -1
fi


# Stop coreaudiod
printf "Stopping Core Audio Server... "
launchctl unload "${COREAUDIOD_PLIST_PATH}"
[ -z "$(launchctl list com.apple.audio.coreaudiod 2>&1)" ] && printf 'OK\n' || printf 'Error\n'


# Verify driver
printf "Driver validity: "
spctl -a "${DSTROOT}/Library/Audio/Plug-Ins/HAL/AudioHub.driver" 2>&1 | awk '{$1=""; print $0}'

printf "PrefPane validity: "
spctl -a "${DSTROOT}/Library/PreferencePanes/AudioHub.prefPane"  2>&1 | awk '{$1=""; print $0}'


# Remove driver
if [ -d "${DRIVER_PATH}" ]; then
    printf "Removing AudioHub Driver... "
    rm -rf "${DRIVER_PATH}" > /dev/null
    [ ! -d "${DRIVER_PATH}" ] && printf "Done\n" || printf "Error\n"
fi

# Install driver
printf "Installing AudioHub Driver... "
cp -rfv "${DSTROOT}/Library/Audio/Plug-Ins/HAL/AudioHub.driver" "/Library/Audio/Plug-Ins/HAL/" > /dev/null
[ -d "${DRIVER_PATH}" ] && printf "Done\n" || printf "Error\n"


# Remove pref pane
if [ -d "${PREFPANE_PATH}" ]; then
    printf "Removing AudioHub PreferencePane... "
    rm -rf "${PREFPANE_PATH}" > /dev/null
    [ ! -d "${PREFPANE_PATH}" ] && printf "Done\n" || printf "Error\n"
fi

# Install pref pane
printf "Installing PreferencePane... "
cp -rfv "${DSTROOT}${PREFPANE_PATH}" "/Library/PreferencePanes/" > /dev/null
[ -d "${PREFPANE_PATH}" ] && printf "Done\n" || printf "Error\n"



# Start coreaudiod
printf "Starting Core Audio Server... "
launchctl load "${COREAUDIOD_PLIST_PATH}"
[ ! -z "$(launchctl list com.apple.audio.coreaudiod)" ] && printf 'OK\n' || printf 'Error\n'


