#!/bin/bash

###########
# ALIASES #
###########

# Directories
alias p="pwd"                                        # Displays File Path
alias ls="ls -a --color=auto"                        # Adds Color
alias ll="ls -a --color --format=single-colum"       # Adds Color & Lists Hidden Directories
alias la='ls -a'									 # Lists Hidden Directories
alias lf='locatef'                                   # Locates Folder/File
alias lls='ls -a --color=auto --format=long'         # Adds Color & Lists Hidden Directories with
alias lla='ls -la'									 # Lists Hidden Directories
alias vls='ls -a --color=auto --format=single-colum' # Adds Color & Lists Directories Vertically
alias tree="filetree"                                # List Directories in Tree Format 
alias grep='grep --color=auto'                       # Adds Color
alias locatef='wheres'                               # Finds Folder/File Location (Ex 'locate rom')
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# Git (Quick Launch)
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

# Bash (Quick Launch)
alias eb='editbash'                               # Edits Bash
alias ub='updatebash'                             # Updates Bash
alias bl="bashlist"                               # Displays Bashlist
alias eba='editbashaliases'						  # Edits Bash Aliases
alias ebc='editbashcolors'						  # Edits Bash Colors
alias ebl='editbashlist'                          # Edits Bash List
alias ebf='editbashfunctions'					  # Edits Bash Functions
alias ebp="editbashpaths"						  # Edits Bash Paths
alias ebpr="editbashprompts"					  # Edits Bash Prompts

# Bash
alias editbash='nano ~/.bashrc'                  				 				# Edits Bash
alias updatebash='source ~/.bashrc'               				 				# Updates Bash
alias bashlist="$HOME/Github/Scripts/Linux/Bash/bashlist"                       # Displays Bash List
alias editbashaliases='nano $HOME/Github/Scripts/Linux/Bash/.bash_aliases'		# Edits Bash Aliases
alias editbashcolors='nano $HOME/Github/Scripts/Linux/Bash/.bash_colors'		# Edits Bash Colors
alias editbashlist='nano $HOME/Github/Scripts/Linux/Bash/bashlist'				# Edits Bash List
alias editbashfunctions='nano $HOME/Github/Scripts/Linux/Bash/.bash_functions'  # Edits Bash Functions
alias editbashpaths='nano $HOME/Github/Scripts/Linux/Bash/.bash_paths'			# Edits Bash Paths
alias editbashprompts='nano $HOME/Github/Scripts/Linux/Bash/.bash_prompts'      # Edits Bash Prompts

# Frequents (Quick Launch)
alias u="trizen -Syyu"                            # Updates System
alias c="clear"                                   # Clears Terminal
alias r="reset"                                   # Resets Terminal
alias e="exit"                                    # Exits Terminal
alias et="emptytrash"                             # Empties Trash
alias sp="Spotify"                                # Launches Spotify
alias ssa="gnome-screenshot -a -i"                # Screenshots Selected Area on Gnome/KDE 
alias wf="weather"								  # Displays Weather Forcast

# Frequents
alias update="trizen -Syyu"                       				        # Updates System
alias screenshot="gnome-screenshot -a -i"         				        # Screenshot Selected Area on Gnome/KDE 
alias emptytrash="rm -rf $HOME/Desktop/trash.desktop"                   # Empties Trash
alias weather="forcast"							  				 	    # Gives weather Report

# Development (Quick Launch)
alias n="nano"									  # Text Editor
alias co="cliamte overview"						  # Climate Overview
alias bdu="buildu" 								  # Moves to DU Build Directory
alias bdr="buildurom"							  # Builds DU ROM	
alias venv2="source venv/bin/activate"			  # Starts Venv2

# Development
alias buildu="cl $HOME/Github/DU && source venv/bin/activate"	        # Venv into DU Build Directory
alias buildurom="cl $HOME/Github/DU && source venv/bin/activate && rom" # Venv into DU Build Directory and start rom script

# SSH & Mosh
# vbox
alias virtualbox='mosh matt@virtualbox'
alias vbox='mosh matt@192.168.43.158'
alias ap='mosh matt@192.168.43.158'               # Mosh for Android Hotspot
alias moshy='mosh matt@192.168.43.158'            # Mosh for Android Hotspot
# xps15
alias xps15='mosh killerdroid96@192.168.1.90'
alias laptop='mosh killerdroid96@192.168.1.90'
# server
alias droidbox='mosh killerdroid96@droidbox'
alias server=''
alias box='mosh '

alias sshy='ssh matt@192.168.43.158'              # SSH for Android Hotspot

# Misc
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p" # Follow Forks With Output Into Separate Files
alias hs='rehistory'                                			 # Terminal History (Ex '!208' etc.. to repeat command)
alias fps='ps aux | grep'                         				 # Displays PID (Ex 'fps terminal') 
alias cmount="mount | column -t"                  			     # Displays Filesystem Mounts

# Fun
alias banner='/etc/profile.d/motd.sh'                     		 # Displays Banner
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'"        # Busy Effect
alias matrix="cmatrix"                                           # Matrix Effect 
alias pipes="pipes.sh"                  				         # Pipes

# Spotify (Needs AUR playerctl and spotify)
alias st="playerctl play-pause"
alias play="playerctl play"
alias pause="playerctl pause"
alias next="playerctl next"
alias previous="playerctl previous"
alias stop="playerctl stop"

# Common Chmods
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

# Executes the last command as root
alias lr='sudo $(history | tail -n 2 | head -n 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g")'

# Hard Drive Information
alias disk='sudo lsblk -f'

# Arcb Linux Paths

alias bashfiles="cl $HOME/Github/Scripts/Linux/Bash/"
alias build="cl $HOME/Github/DU"
alias coding="cl $HOME/Github/C"
alias files="cl $HOME/Github/Scripts/Linux/Files"
alias github="cl $HOME/Github"
alias kde="cl $HOME/Github/Scripts/Linux/KDE/"
alias linux="cl $HOME/Github/Scripts/Linux"
alias roms="cl $HOME/Github/Scripts/Linux/ROMs"
alias scripts="cl $HOME/Github/Scripts"
alias setups="cl $HOME/Github/Scripts/Linux/Setups"

# Windows 10 Paths (Place w infront of usual commands)
alias cygwin="cl C:/Toolchains/cygwin64"
alias msys="cl C:/Toolchains/msys64"
alias code="cl C:/Users/mkell/Desktop/Coding/C_&_C++"
alias wcoding="c C:/Users/mkell/Desktop/Coding"
alias wscripts="c C:/Users/mkell/Desktop/Coding/Github/Scripts"
alias wlinux="cl C:/Users/mkell/Desktop/Coding/Scripts/Github/Linux"
alias wfiles="cl C:/Users/mkell/Desktop/Coding/Scripts/Github/Files"
alias wroms="cl C:/Users/mkell/Desktop/Coding/Scripts/Github/ROMs"
alias wbl="C:/Users/mkell/Desktop/Coding/Scripts/Github/Linux/bashlist"