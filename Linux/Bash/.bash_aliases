#!/bin/bash

###########
# ALIASES #
###########

# Linux Paths
alias github="cl $HOME/Github"
alias coding="cl $HOME/Github/C"
alias scripts="cl $HOME/Github/Scripts"
alias linux="cl $HOME/Github/Scripts/Linux"
alias bashfiles="cl $HOME/Github/Scripts/Linux/Bash/"
alias bashlist="$HOME/Github/Scripts/Linux/Bash/bashlist"
alias files="cl $HOME/Github/Scripts/Linux/Files"
alias kde="cl $HOME/Github/Scripts/Linux/KDE/"
alias roms="cl $HOME/Github/Scripts/Linux/ROMs"
alias setups="cl $HOME/Github/Scripts/Linux/Setups"
alias build="cl $HOME/Github/DU"

# Windows Paths (Place w infront of usual commands)
alias cygwin="cl C:/Toolchains/cygwin64"
alias msys="cl C:/Toolchains/msys64"
alias code="cl C:/Users/mkell/Desktop/Coding/C_&_C++"
alias wcoding="c C:/Users/mkell/Desktop/Coding"
alias wscripts="c C:/Users/mkell/Desktop/Coding/Github/Scripts"
alias wlinux="cl C:/Users/mkell/Desktop/Coding/Scripts/Github/Linux"
alias wfiles="cl C:/Users/mkell/Desktop/Coding/Scripts/Github/Files"
alias wroms="cl C:/Users/mkell/Desktop/Coding/Scripts/Github/ROMs"
alias wbl="C:/Users/mkell/Desktop/Coding/Scripts/Github/Linux/bashlist"

# Directories
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias tree="filetree"                                # List Directories in Tree Format 
alias ls="ls -a --color=auto"                        # Adds Color
alias ll="ls -a --color --format=single-colum"       # Adds Color & Lists Hidden Directories
alias la='ls -a'									 # Lists Hidden Directories
alias lls='ls -a --color=auto --format=long'         # Adds Color & Lists Directories with
alias lla='ls -la'									 # Lists Hidden Directories
alias vls='ls -a --color=auto --format=single-colum' # Adds Color & Lists Directories Vertically
alias grep='grep --color=auto'                       # Adds Color
alias locate='whereis'                               # Finds Folder/File Location (Ex 'locate rom')

# Hard Drives
alias disk='sudo lsblk -f'                        # Lists Disk Information

# Frequents (Quick Launch)
alias ap='mosh matt@192.168.43.158'               # Android Hotspot
alias bl="bashlist"                               # Displays Bashlist
alias eb='editbash'                               # Edits Bash
alias ub='source ~/.bashrc'                       # Updates Bash
alias u="pacaur -Syu"                             # Updates System
alias c="clear"                                   # Clears Terminal
alias r="reset"                                   # Resets Terminal
alias e="exit"                                    # Exits Terminal
alias et="rm -rf $HOME/Desktop/trash.desktop"     # Empties Trash
alias p="pwd"                                     # Displays File Path
alias sp="Spotify"                                # Launches Spotify
alias ssa="gnome-screenshot -a -i"                # Screenshot Selected Area on Gnome/KDE 
alias co="climate overview"						  # Displays System Overview
alias bdu="cl $HOME/Github/DU"					  # Moves to DU Build Directory

# Frequents
alias weather="forcast"							  # Gives weather Report
alias screenshot="gnome-screenshot -a -i"         # Screenshot Selected Area on Gnome/KDE 
alias editbash='nano ~/.bashrc'                   # Edits Bash
alias updatebash='source ~/.bashrc'               # Updates Bash
alias update="pacaur -Syu"                        # Updates System

# Misc
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p" # Follow Forks With Output Into Separate Files
alias hs='history'                                				 # Terminal History (Ex '!208' etc.. to repeat command)
alias fps='ps aux | grep'                         				 # Displays PID (Ex 'fps terminal') 
alias cmount="mount | column -t"                  			     # Displays Filesystem Mounts

# Fun
alias banner='/etc/profile.d/motd.sh'                     # Displays Banner
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'" # Busy Effect
alias matrix="cmatrix"                                    # Matrix Effect 
alias pipes="pipes.sh"                  				  # Pipes

# Spotify (Needs AUR playerctl and spotify)
alias st="playerctl play-pause"
alias play="playerctl play"
alias pause="playerctl pause"
alias next="playerctl next"
alias previous="playerctl previous"
alias stop="playerctl stop"

# Aliases for git
alias git='git --no-pager'
alias gs='git status'
alias gb='git branch -a --color'
alias gd='git diff --color'
alias gc='git commit'
alias ga='git add'
alias gl='git log --pretty=oneline'
alias gps='git push'
alias gpl='git pull'
alias gco='git checkout'
alias grm='git rm'
alias gmv='git mv'

# Aliases for common chmods
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

# Execute the last command as root
alias lr='sudo !!'