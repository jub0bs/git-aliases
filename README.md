# Jubobs's Git aliases

A collection of UNIX shell scripts for defining useful Git aliases,
with an emphasis on

- efficiency
- portability:  all scripts are tested in `dash`
- stability:    Git plumbing commands are used wherever possible

## Aliases

- `git greenbranch`: list local branches that contain commits newer than
 a specified date

- `git isnewest`: is the current branch the most recent one?

- `git ndiff`: show the changes between the n-th revision that changed a
 specified path

- `git newest-branch`: show the short name of the most recent branch

- `git status-dot`: show the status of non-repository files in the working
 directory

## License

All the scripts are released under the terms of the MIT license.
