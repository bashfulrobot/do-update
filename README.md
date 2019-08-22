# do-update

## Functions
* APT wrapper script that does a little housecleaning while I update the system.
  * Nutshell - update cache, dist-upgrade, clean, autoremove, install -f

## Requirements
* apt
* git
* bash shell

## Usage
I generally just add an alias to my `.bashrc` to consume the script.

I.E. - `alias do-update="$HOME/dotfiles/do-update.sh"`
