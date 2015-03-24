#!/bin/sh

# git-newest-branch.sh
#
# A shell script for defining (at the user level) a Git alias called
# "newest-branch" that outputs the name of the newest branch; more
# specifically, the (short) name of branch whose tip is the most recent
# (in terms of committer date) of all the branches' tips.

git config --global alias.newest-branch \
    "for-each-ref --count=1
                  --sort='-committerdate'
                  --format='%(refname:short)'
                  refs/heads"
