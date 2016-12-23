#!/bin/sh

#  install.sh
#  AudioHub
#
#  Created by Daniel Lindenfelser on 11/09/15.
#  Copyright © 2015 Daniel Lindenfelser. All rights reserved.

COREAUDIOD_PLIST_PATH='/System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist'

# Run with root via GUI
if [ $(id -u) != 0 ]
then
##    SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
##    SCRIPT_NAME=$(basename "$0")
##    SCRTPT_PATH="${SCRIPT_DIR}/${SCRIPT_NAME}"
##    osascript -e "do shell script \"${SCRTPT_PATH}\" with administrator privileges"
    osascript -e 'do shell script "\"/Users/mxa/Documents/mxa/AudioHub/AudioHub/Supporting Files/Installation/restart.sh\"" with administrator privileges'
    exit
fi

printf "Stopping Core Audio Server... "
launchctl unload "${COREAUDIOD_PLIST_PATH}"
[ -z "$(launchctl list | grep coreaudiod)" ] && printf 'OK\n' || printf 'Error\n'


printf "Starting Core Audio Server... "
launchctl load "${COREAUDIOD_PLIST_PATH}"
[ ! -z "$(launchctl list | grep coreaudiod)" ] && printf 'OK\n' || printf 'Error\n'
