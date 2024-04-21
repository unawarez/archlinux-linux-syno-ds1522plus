A fork of Arch's `linux` kernel package for the Synology DS1522+. It's only some config changes, nothing interesting[^synobrd]. It surely works on other size models of the same series, but I'm not sure what those are. Also not sure if any other series have similar hardware. I only have this one NAS. So, this repo is named conservatively.

This is *not* all you need to boot one of these comfortably. For instance, you need to force a magic set of GPIO pins on to power the USB ports.

The only *required* change is compiling in the serial port driver. Without it, kernel debug output *still works* over the serial port, but `init` will always fail. Beyond that, since I was already stuck compiling the kernel, I set GCC `-march` to Zen v1 and then tried to disable as many modules as possible to speed up compiling on the NAS itself. But there are certainly still many unneeded hardware modules in there, and also my definition of 'unnecessary' includes lots of filesystems/weird network stuff/etc that maybe shouldn't have been removed. I don't 100% know what hardware is on this board and haven't had the time/setup/desire to A/B-test disabling config options.

[^synobrd]: There are some kernel modules in stock DSM that need reversing. That would lead to some actual patches becoming part of this. Fan control, power button LED, and likely other things don't work without those custom modules.
