#!/bin/bash

# allows for passing REBASE_HEAD if you like. TODO detect?
THEIRS="${1:-MERGE_HEAD}"

# keys/ should be completely replaced with upstream every time.
# automerging it will not necessarily delete old keys.
git checkout "$THEIRS" -- keys/

# .SRCINFO needs to be updated with makepkg. to keep this runnable
# outside of arch, it's just deleted for now, to lower the amount of
# noise in the diff. TODO if PKGBUILD gets sed'd then this could also
# be sed'd with the same replacements, to automate it correctly here
# 99% of the time. also TODO check for makepkg and just do it now,
# though note "check for makepkg" also means check uid != 0 and files AND cwd
# are writable.
git rm -f .SRCINFO

# TODO take PKGBUILD as ours with a couple fields sed'd(?) from theirs.
# also TODO if updpkgsums is available, run it now.
