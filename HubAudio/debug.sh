#!/bin/sh

#  Script.sh
#  Hub
#
#  Created by Daniel Lindenfelser on 11/09/15.
#  Copyright © 2015 Daniel Lindenfelser. All rights reserved.

echo "Stop CoreAudio Server"
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist

if [ -d /Library/Audio/Plug-Ins/HAL/HubAudio.driver ]; then
    echo "Remove Hub Driver"
    sudo rm -rf /Library/Audio/Plug-Ins/HAL/HubAudio.driver > /dev/null
fi

echo "Update Hub Driver"
sudo cp -rfv /tmp/Hub.dst/Library/Audio/Plug-Ins/HAL/HubAudio.driver /Library/Audio/Plug-Ins/HAL/ > /dev/null

echo "Start CoreAudio Server"
sudo launchctl load /System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist