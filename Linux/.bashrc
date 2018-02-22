#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ ' # Defaults
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano

/etc/profile.d/motd.sh # Displays MOTD/Banner when opening new terminal

#########
#EXPORTS#
#########
export LC_ALL="C"
export USE_CCACHE=1
export USE_CCACHE=60
export USE_NINJA=false

#########
# PATHS #
#########
PATH=$PATH:$HOME/Github; export PATH
PATH=$PATH:$HOME/Github/Scripts; export PATH
PATH=$PATH:$HOME/Github/Scripts/ROMs; export PATH
PATH=$PATH:$HOME/Github/Scripts/Linux; export PATH
PATH=$PATH:$HOME/Github/Scripts/Files; export PATH

#########
# ALIAS #
#########
# Linux Paths
alias github="cl $HOME/Github"
alias coding="cl $HOME/Github/C"
alias scripts="cl $HOME/Github/Scripts"
alias linux="cl $HOME/Github/Scripts/Linux"
alias files="cl $HOME/Github/Scripts/Files"
alias roms="cl $HOME/Github/Scripts/ROMs"
alias bashlist="$HOME/Github/Scripts/Linux/bashlist"

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
alias tree="filetree"                             # List Directories in Tree Format 
alias ls="ls --color=auto"                        # Adds Color
alias ll="ls --color -a --format=single-colum"    # Adds Color & Lists Hidden Directories
alias lls='ls --color=auto --format=long'         # Adds Color & Lists Directories with Permissions/Date
alias vls='ls --color=auto --format=single-colum' # Adds Color & Lists Directories Vertically
alias grep='grep --color=auto'                    # Adds Color
alias locate='whereis'                            # Finds Folder/File Location (Ex 'locate rom')

# Hard Drives
alias disk='sudo lsblk -f'                        # Lists Disk Information

# Frequents (Quick Launch)
alias ap='ssh matt@192.168.43.39'                 # Android Hotspot
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
alias co="climate overview"

# Frequents
alias screenshot="gnome-screenshot -a -i"         # Screenshot Selected Area on Gnome/KDE 
alias editbash='nano ~/.bashrc'                   # Edits Bash
alias updatebash='source ~/.bashrc'               # Updates Bash
alias update="pacaur -Syu"                        # Updates System

# Misc
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p" 
alias hs='history'                                # Terminal History (Ex '!208' etc.. to repeat command)
alias fps='ps aux | grep'                         # (Ex 'fps terminal' displays pid of terminals
alias cmount="mount | column -t"                  # Displays Filesystem Mounts

# Fun
alias banner='/etc/profile.d/motd.sh'                     # Displays Banner
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'" # Busy Effect
alias matrix="cmatrix"                                    # Matrix Effect 
alias pipes="pipes.sh -t 4"			          # Pipes

# Spotify (Needs AUR playerctl and spotify)
alias st="playerctl play-pause"
alias play="playerctl play"
alias pause="playerctl pause"
alias next="playerctl next"
alias previous="playerctl previous"
alias stop="playerctl stop"

#############
# FUNCTIONS #
#############
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

##########
# Colors #
##########
# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple 
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

