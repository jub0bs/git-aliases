# Jubobs's Git aliases

A collection of UNIX shell scripts for defining useful Git aliases,
with an emphasis on

- portability (all scripts are tested in `dash`)
- stability (Git plumbing commands are used wherever possible)

## Aliases

- `git greenbranch`: list local branches that contain commits newer than
 a specific date

- `git isnewest`: is the current branch the most recent one?

- `git newest-branch`: show the short name of the most recent branch

- `git status-dot`: show the status of non-repository files in the working
 directory
