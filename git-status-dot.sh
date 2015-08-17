#!/bin/sh

# git-status-dot.sh
#
# Show the status of non-directory files (if any) in the working directory
#
# To make a Git alias called 'status-dot' out of this script,
# put the latter on your search path, and run
#
#   git config --global alias.status-dot '!sh git-status-dot.sh'

# Because GIt aliases are run from the top-level directory of the repo,
# we need to change directory back to $GIT_PREFIX.
[ "$GIT_PREFIX" != "" ] && cd "$GIT_PREFIX"

# List Non-Directory Files in the Current Directory
lsnondirdot=$(ls -ap | grep -v /)

# If "lsnondirdot" is not empty, pass its value to "git status".
if [ -n "$lsnondirdot" ]; then
  git status -- $lsnondirdot
else
  printf "No non-directory files in the working directory\n"
fi

exit $?
