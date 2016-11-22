//
//  AudioHub.h
//  AudioHub
//
//  Created by Daniel Lindenfelser on 14/09/15.
//  Copyright © 2015 Daniel Lindenfelser. All rights reserved.
//

#ifndef __AudioHubTypes__
#define __AudioHubTypes__

#include <CoreFoundation/CoreFoundation.h>
#include <CoreAudio/CoreAudioTypes.h>

static const CFStringRef kAudioHubBundleIdentifier = CFSTR("audiohub.audiohub.AudioHub");
static const CFStringRef kAudioHubManufacturer = CFSTR("AudioHub");

static const CFStringRef kAudioHubBoxName = CFSTR("audiohub.audiohub.AudioHubBox");
static const CFStringRef kAudioHubBoxModelName = CFSTR("audiohub.audiohub.AudioHubBox");
static const CFStringRef kAudioHubBoxSerialNumber = CFSTR("0815");
static const CFStringRef kAudioHubBoxFirmwareVersion = CFSTR("1.0");
static const CFStringRef kAudioHubBoxUID = CFSTR("audiohub.audiohub.AudioHub:1");

static const CFStringRef kAudioHubDeviceModelUID = CFSTR("audiohub.audiohub.AudioHubDevice");


enum {
    kAudioHubCustomPropertySettings = 'ephs',
    kAudioHubCustomPropertyActive = 'epha'
};
const UInt32 kAudioHubCustomProperties = 2;

static const CFStringRef kAudioHubSettingsKey = CFSTR("AudioHubSettings");
static const CFStringRef kAudioHubSettingsKeyDevices = CFSTR("AudioHubDevices");
static const CFStringRef kAudioHubSettingsKeyDeviceName = CFSTR("Name");
static const CFStringRef kAudioHubSettingsKeyDeviceUID = CFSTR("UID");
static const CFStringRef kAudioHubSettingsKeyDeviceChannels = CFSTR("Channels");

static const UInt32 kAudioHubMaximumDeviceChannels = 32;


#endif /* __AudioHubTypes__ */
