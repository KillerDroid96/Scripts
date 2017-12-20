#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
# >>> BEGIN ADDED BY CNCHI INSTALLER
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano
# <<< END ADDED BY CNCHI INSTALLER

#######
#PATHS#
#######
PATH=$PATH:/home/killerdroid96/ROMs/Developers/MatthewKeller/Scripts/ROMs; export PATH
PATH=$PATH:/home/killerdroid96/ROMs/Developers/MatthewKeller/Scripts/Linux; export PATH
PATH=$PATH:/home/killerdroid96/ROMs/Developers/MatthewKeller/Scripts/Files; export PATH
PATH=$PATH:/home/killerdroid96/ROMs/Developers/NathanChancellor/nscripts; export PATH

#######
#ALIAS#
#######

#Color
alias ls="ls --color=auto" #Adds Color
alias ll="ls --color -al" #Adds Color
alias grep='grep --color=auto' #Adds Color

#Frequent
alias XPS15='ssh username@ip' #Starts SSH
alias editbash='nano ~/.bashrc' #Edits Bash
alias updatebash='source ~/.bashrc' #Updates Bash
alias c="clear" #Clears Terminal
alias r="reset" #Resets Terminal
alias e="exit" #Exits Terminal
alias et="rm -rf $HOME/.local/share/Trash/files" #Emptys Trash
alias p="pwd" #Displays File Path

#Fun
alias banner='/etc/profile.d/motd.sh' #Displays MOTD & Banner
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'" #Busy Effect
alias matrix="cmatrix" #Matrix Effect 

#Spotify (Needs AUR playerctl and spotify)
alias spp="playerctl play-pause" #Toggle Play/Pause
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