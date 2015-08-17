#!/bin/sh

# git-ndiff.sh
#
# Usage: git ndiff <n> <path>
#
# Show changes between the n-th last revision (in the sense of Git's
# topological order) that changed <path> and HEAD
#
# To make a Git alias called 'ndiff' out of this script,
# put the latter on your search path, and run
#
#   git config --global alias.ndiff '!sh git-ndiff.sh'


ndifferror(){
  printf "usage: git ndiff <n> <path>\n"
  printf "where <n> is a positive integer\n"
  exit 1
}

# Check that two arguments were passed
if [ $# -ne 2 ]; then
  ndifferror
fi

# Check that the first argument is a positive integer
if [ "$1" -gt 0 ] >/dev/null 2>&1; then
  n=$1
else
    ndifferror
fi

# Check that the second argument is an existing path
if [ -e $2 ]; then
  path="$2"
else
  exit 0
fi

# Get the revision of interest
nthrev=$(git log --follow --pretty=format:%H -- $path | sed -n "$n""p")
# Note: Unfortunately, the "--follow" functionality is only provided by the
# porcelain command "git log", and not by any plumbing command (Git 2.5.0).

# Show changes of interest
if [ -n "$nthrev" ]; then
  git diff $nthrev -- $path
else
  exit 0
fi

exit $?
