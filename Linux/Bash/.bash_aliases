#!/bin/bash

###########
# ALIASES #
###########

# Git (Quick Launch)
alias git1='git --no-pager'
alias gs='git status'
alias gb='git branch -a --color'
alias gd='git diff --color'
alias gc='git commit' 
alias gcm='git commit -m'
alias ga='git add'
alias gaa='git add --all'    
alias gac='git add && git commit'
alias gaac='git add --all && git commit'
alias {gl,gitlog}='git log --pretty=oneline'
alias gps='git push'
alias gpl='git pull'
alias gco='git checkout'
alias grm='git rm'
alias gmv='git mv'

# Bash
alias {editbash,eb}='nano ~/.bashrc'        				 				            # Edits Bash
alias {updatebash,ub}='source ~/.bashrc && bash'               				 		    # Updates Bash
alias {bashlist,bl}="$HOME/Github/Scripts/Linux/Bash/bashlist"                          # Displays Bash List
alias {editbashaliases,eba}='nano $HOME/Github/Scripts/Linux/Bash/.bash_aliases'		# Edits Bash Aliases
alias {editbashcolors,ebc}='nano $HOME/Github/Scripts/Linux/Bash/.bash_colors'		    # Edits Bash Colors
alias {editbashlist,ebl}='nano $HOME/Github/Scripts/Linux/Bash/bashlist'				# Edits Bash List
alias {editbashfunctions,ebf}='nano $HOME/Github/Scripts/Linux/Bash/.bash_functions'    # Edits Bash Functions
alias {editbashpaths,ebp}='nano $HOME/Github/Scripts/Linux/Bash/.bash_paths'			# Edits Bash Paths
alias {editbashprompts,ebpr}='nano $HOME/Github/Scripts/Linux/Bash/.bash_prompts'       # Edits Bash Prompts

# System (Quick Launch)
alias c="clear"                                                                                  # Clears Terminal
alias r="reset"                                                                                  # Resets Terminal
alias e="exit"                                                                                   # Exits Terminal
alias sp="Spotify"                                                                               # Launches Spotify
alias ssa="gnome-screenshot -a -i"                                                               # Screenshots Selected Area on Gnome/KDE
alias hs='rehistory'                                			                                 # Recent Terminal History (Ex '!208' etc.. to repeat command)
alias fps='ps aux | grep'                         				                                 # Displays PID (Ex 'fps terminal')
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'  
alias {update,u,pacaur}="trizen -Syyu"                       				                     # Updates System
alias {screenshot,ssa}="gnome-screenshot -a -i"         				                         # Screenshot Selected Area on Gnome/KDE 
alias {emptytrash,et}="rm -rf $HOME/Desktop/trash.desktop"                                       # Empties Trash
alias {weather,wf}="forcast"							  				 	                     # Gives weather Report
alias {lastroot,rr,lr}='sudo $(history | tail -n 2 | head -n 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g")' # Executes the last command as root
alias {trace,intercept}="sudo strace -ff -e trace=write -e write=1,2 -p"                         # Follow Forks With Output Into Separate Files
alias {trizenq,trizens}='trizen -Syyu --quiet --noconfirm --noedit'
# Development 
alias n="nano"									                                  # Text Editor
alias co="cliamte overview"						                                  # Climate Overview
alias venv2="source venv/bin/activate"			                                  # Starts Venv2
alias {buildu,dub,dud}="cl $HOME/Github/DU && source venv/bin/activate"	          # Venv into DU Build Directory
alias {buildurom,bdr,bdu}="cl $HOME/Github/DU && source venv/bin/activate && rom" # Venv into DU Build Directory and start rom script
alias {dulog,du_log,dul}=" cat $HOME/Github/DU/du_log.txt"                        # Reads DU Build Log
alias {out,dumpling,op5t}="cl $HOME/Github/DU/out/target/product/dumpling/"		  # Moves to Out Directory for 5T

# Mosh
alias {virtualbox,vbox,vb,ap,arch,moshy}='mosh matt@virtualbox'    # Mosh VirtualBox
alias sshy='ssh matt@192.168.43.158'                               # SSH VirtualBox
alias {laptop,xps15,externalssd}='mosh killerdroid96@192.168.1.90' # Mosh External SSD
alias {box,droidbox,server}='mosh killerdroid96@droidbox'          # Mosh Server

# Fun
alias banner='/etc/profile.d/motd.sh'                     		   # Displays Banner
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'"          # Busy Effect
alias matrix="cmatrix"                                             # Matrix Effect 
alias pipes="pipes.sh"                  				           # Pipes

# Spotify (Needs AUR playerctl and spotify)
alias st="playerctl play-pause"
alias play="playerctl play"
alias pause="playerctl pause"
alias next="playerctl next"
alias previous="playerctl previous"
alias stop="playerctl stop"

# Hard Drive Information
alias cmount="mount | column -t"           # Displays Filesystem Mounts
alias disk1='sudo lsblk -f'                # Displays Name, FS Type, Label, UUID & Mountpoint
alias disk2='sudo smartctl -a /dev/sda1'   # Detailed Report & SMART Status
alias disk3='sudo fdisk -l'                # Checks Partiitions
alias disk4='sudo cfdisk' 				   # Linux Partition Editor GUI
alias disk5='sudo pydf'				       # A Better Version of df 
alias disk6='sudo df -h'				   # Displays Mounted File Systems
alias disk7='sudo df -h --output=source,fstype,size,used,avail,pcent,target -x tmpfs -x devtmpfs'
alias disk_trim='sudo dd if=/dev/zero of=/var/tmp/bigemptyfile bs=4096k ; rm /var/tmp/bigemptyfile'

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

# Arch Linux Paths
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