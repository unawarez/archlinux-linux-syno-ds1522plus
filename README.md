A fork of Arch's `linux` kernel package for the Synology DS1522+. It's only some config changes, nothing interesting[^synobrd]. It surely works on other size models of the same series, but I'm not sure what those are. Also not sure if any other series have similar hardware. I only have this one NAS. So, this repo is named conservatively.

A huge goal of putting this on GitHub was to use GHA workflows to automate checking for and merging in updates. If any custom kernel build doesn't have a strategy for staying very up-to-date then it is borderline useless. This has been *very* buggily implemented and in fact had to be turned off at the time of writing.

Unfortunately this repo history is old and weird, and it probably needs to be restarted with a different strategy. The Kconfig has gotten out of hand and started missing upstream updates. Using the `make *config` helpers tends to move blocks of lines around which destroys git diffs. Even regardless of that, it would make much more sense to use patches or kernel `merge_config.sh` to document the real changes being made.

This is *not* all you need to boot one of these comfortably. For instance, you need to force a magic set of GPIO pins on to power the USB ports.

The only mandatory config change is compiling in the serial port driver. Without it, kernel debug output *still works* over the serial port, but `init` will always fail. Beyond that, since I was already stuck compiling the kernel, I set GCC `-march` to Zen v1 and then tried to disable as many modules as possible to speed up compiling on the NAS itself. But there are certainly still many unneeded hardware modules in there, and also my definition of 'unnecessary' includes lots of filesystems/weird network stuff/etc that maybe shouldn't have been removed. I don't 100% know what hardware is on this board and haven't had the time/setup/desire to A/B-test disabling config options.

[^synobrd]: There are some kernel modules in stock DSM that need reversing. That would lead to some actual patches becoming part of this. Fan control, power button LED, and likely other things don't work without those custom modules.
