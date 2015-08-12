#!/bin/sh

# git-branchesthatcontain.sh
#
# List the local branches that contain a specific revision
#
# Usage: git branchthatcontain <rev>
#
# To make a Git alias called 'branchesthatcontain' out of this script,
# put the latter on your search path, and run
#
#   git config --global alias.branchesthatcontain \
#       '!sh git-branchesthatcontain.sh'

if [ $# -ne 1 ]; then
    printf "usage: git branchesthatcontain <rev>\n\n"
    exit 1
fi

rev=$1

git for-each-ref --format='%(refname:short)' refs/heads \
    | while read ref; do
          if git merge-base --is-ancestor "$rev" "$ref"; then
              echo "$ref"
          fi;
      done

exit $?
