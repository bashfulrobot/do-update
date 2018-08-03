#
# Copyright (c) 2018 Dustin Krysak
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#!/bin/bash

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Load Bash It - needed to get bash-it function
source "$BASH_IT"/bash_it.sh > /dev/null

# Vars
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
NC=$(tput sgr0) 

online="${GREEN}online$NC"
offline="${RED}offline$NC"

# Define functions

function echoHeader () {
echo
echo
printf "%40s \n" "[$RED $1 $NC]"
# echo "> > >  $1 =========="
echo
}

function echoSection () {
echo
echo
printf "$GREEN > > > $NC %1s \n" "$YELLOW $1 $NC"
# echo "> > >  $1 =========="
echo
}
echoHeader "Starting System Update"
echoSection "Updating Sources"
sudo apt update
sleep 1
echoSection "Updating Distro"
sudo apt dist-upgrade -y
sleep 1
echoSection "Performing Autoremove"
sudo apt clean -y
sudo apt autoremove -y
sleep 1
echoSection "Adding Missing Deps"
sudo apt install -f -y
sleep 1

echoSection "Updating Bash-it"

#cd ~/.bash_it && git reset --hard > /dev/null

cd ~/.bash_it
git stash
git stash drop
bash-it update
echo

echoHeader "Completed System Update"

exit 0
N ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
