# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-4

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func

#########
#EXPORTS#
#########
#export LC_ALL="C"
#export USE_CCACHE=1
#export USE_CCACHE=60
#export USE_NINJA=false


#######
#PATHS#
#######
#Arch Laptop
PATH=$PATH:/home/matt/ROMs/Developers/MatthewKeller/Scripts/ROMs; export PATH
PATH=$PATH:/home/matt/ROMs/Developers/MatthewKeller/Scripts/Linux; export PATH
PATH=$PATH:/home/matt/ROMs/Developers/MatthewKeller/Scripts/Files; export PATH
PATH=$PATH:/home/matt/ROMs/Developers/NathanChancellor/nscripts; export PATH
#Arch Desktop
PATH=$PATH:/home/killerdroid96/Scripts/ROMs; export PATH
PATH=$PATH:/home/killerdroid96/Scripts/Linux; export PATH
PATH=$PATH:/home/killerdroid96/Scripts/Files; export PATH

############
#PATH ALIAS#
############
#Arch Laptop (Upper Case)
alias scripts="cd home/matt/ROMs/Developers/MatthewKeller/Scripts/ROMs"
alias linux="cd home/matt/ROMs/Developers/MatthewKeller/Scripts/Linux"
alias files="cd home/matt/ROMs/Developers/MatthewKeller/Scripts/Files"
alias roms="cd home/matt/ROMs/Developers/MatthewKeller/Scripts/ROMs"
#Windows Laptop (Place w infront of usual commands)
alias cygwin="cd C:/Toolchains/cygwin64"
alias msys="cd C:/Toolchains/msys64"
alias code="cd C:/Users/mkell/Desktop/Coding/C_&_C++"
alias wcoding="cd C:/Users/mkell/Desktop/Coding"
alias wscripts="cd C:/Users/mkell/Desktop/Coding/Github/Scripts"
alias wlinux="cd C:/Users/mkell/Desktop/Coding/Scripts/Github/Linux"
alias wfiles="cd C:/Users/mkell/Desktop/Coding/Scripts/Github/Files"
alias wroms="cd C:/Users/mkell/Desktop/Coding/Scripts/Github/ROMs"
alias wbl="C:/Users/mkell/Desktop/Coding/Scripts/Github/Linux/bashlist"

#############
#OTHER ALIAS#
#############
#Color
alias ls="ls --color=auto" #Adds Color
alias ll="ls --color -al" #Adds Color
alias grep='grep --color=auto' #Adds Color

#Frequent
alias ssa="maim ~/Pictures/Screenshot_$(date +%s).png -s -m 10 | xclip -selection clipboard -t image/png" #ScreenshotShotArea KDE
alias gssa="gnome-screenshot -a -i" #Screenshot Selected Area on Gnome
alias bl="bashlist" #Quick launch for bashlist
alias editbash='nano ~/.bashrc' #Edits Bash
alias updatebash='source ~/.bashrc' #Updates Bash
alias update="pacaur -Syu"
alias c="clear" #Clears Terminal
alias r="reset" #Resets Terminal
alias e="exit" #Exits Terminal
alias et="rm -rf $HOME/.local/share/Trash/files" #Emptys Trash
alias edt="rm -rf /home/matt/Desktop/trash.desktop"
alias edt="rm -rf /home/killerdroid96/Desktop/trash.desktop"
alias p="pwd" #Displays File Path
alias AP='ssh user@host' #SSH
alias sp="Spotify"

#Fun
alias banner='/etc/profile.d/motd.sh' #Displays MOTD & Banner
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'" #Busy Effect
alias matrix="cmatrix" #Matrix Effect 

#Spotify (Needs AUR playerctl and spotify)
alias st="playerctl play-pause" #Toggle Play/Pause
alias play="playerctl play"
alias pause="playerctl pause"
alias next="playerctl next"
alias previous="playerctl previous"
alias stop="playerctl stop"

#Others
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p" 
alias meminfo='free -m -l -t'
alias hs='history | grep' # hs history displays comand history, use !208 etc to repeat command
alias fps='ps aux | grep' #Usage: fps terminal, displays pid of terminals
alias cmount="mount | column -t"

###########
#FUNCTIONS#
###########
cl() { # cd and ls in one
    local dir="$1"
    local dir="${dir:=$HOME}"
    if [[ -d "$dir" ]]; then
        cd "$dir" >/dev/null; ls
    else
        echo "bash: cl: $dir: Directory not found"
    fi
}

calc() { # terminal calculator
    echo "scale=3;$@" | bc -l
}

ipif() { # lists ip, hostname, city, region, country, loc, org, postal
    if grep -P "(([1-9]\d{0,2})\.){3}(?2)" <<< "$1"; then
    curl ipinfo.io/"$1"
    else
    ipawk=($(host "$1" | awk '/address/ { print $NF }'))
    curl ipinfo.io/${ipawk[1]}
    fi
    echo
}

note () { #Usage note test, saves to .notes
        # if file doesn't exist, create it
    if [[ ! -f $HOME/.notes ]]; then
        touch "$HOME/.notes"
    fi

    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.notes"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        printf "%s" > "$HOME/.notes"
    else
        # add all arguments to file
        printf "%s\n" "| $*" >> "$HOME/.notes"
    fi
}

notes () { # Displays items in .note
    echo ""
    echo "==========================="
    echo "|          Notes          |"
    echo "==========================="
    cat $HOME/.notes
    echo "==========================="
    echo ""
}

editnotes () {
    nano $HOME/.notes
}

numfiles() { # Usage numfiles scripts > 88 files in scripts
# numfiles test > 10 files in test
    N="$(ls $1 | wc -l)"; 
    echo "$N files in $1";
}

history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
# history displays comand history, use !208 etc to repeat command

mcd () { # Usage mcd test, creates and moves into test directory
    mkdir -p $1
    cd $1
}


function whereis (){ # Usage whereis scripts, displays all locations with the word scripts (case sensitive)
  find . -name "$1*";
}

backup() { cp "$1"{,.bak};} # will create [file].bak in the same directory

sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 
# Lists files by size in current directory
