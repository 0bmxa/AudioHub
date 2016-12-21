# AudioHub

AudioHub is a macOS CoreAudio Server PlugIn which provides a virtual audio interface. It enabling complex routing of audio signals between applications.

## Running

This project has no own releases so far. Check the [Releases of UltraschallHub](/Ultraschall/Hub/releases) in the meantime.

## Debugging

For being able to attach a debugger to `coreaudiod` (which is run by `launchd`), System Integrity Protection (SIP) has to be disabled. SIP is enabled by default since ~macOS~ Mac OS X 10.11 El Capitan and can be [disabled via `csrutil(1)`](https://developer.apple.com/library/content/documentation/Security/Conceptual/System_Integrity_Protection_Guide/ConfiguringSystemIntegrityProtection/ConfiguringSystemIntegrityProtection.html).

## Credits

This is a fork of [Ultraschall/Hub](https://github.com/Ultraschall/Hub). Most of the credit and copyright belongs to them.

Please consider supporting them.  
[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=danlin&url=https://github.com/Ultraschall/Hub&tags=UltraschallHub&category=software)
