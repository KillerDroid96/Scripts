#!/bin/bash

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

# history displays comand history, use !208 etc to repeat command
history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10

# Usage mcd test, creates and moves into test directory
mcd () { 
    mkdir -p $1
    cd $1
}

# Usage whereis scripts, displays all locations with the word scripts (case sensitive)
function whereis (){ 
  find . -name "$1*";
}

# Will create [file].bak in the same directory
backup() { cp "$1"{,.bak};} 

# Lists files by size in current directory
sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 

# Prints weather information 
forcast(){
	printf "\n    Todays Forcast    :  $(curl -s wttr.in/~Pittsburg,KS?0?q?T | awk '/°(C|F)/ {printf $(NF-1) $(NF) " ("a")"} /,/ {a=$0}') \n"
	printf "	 	      :  $(curl -s wttr.in/~Overland+Park,KS?0?q?T | awk '/°(C|F)/ {printf $(NF-1) $(NF) " ("a")"} /,/ {a=$0}') \n\n"
}

# Search for a process containing a given name
function pps() {
ps aux | grep "$@" | grep -v 'grep';
}

function onLogin() {
    export GIT_PS1_SHOWDIRTYSTATE=1;
    export GIT_PS1_SHOWSTASHSTATE=1;
    export GIT_PS1_SHOWUNTRACKEDFILES=1;
    export GIT_PS1_SHOWUPSTREAM=auto;
    export GIT_PS1_SHOWCOLORHINTS=1;
    unset PS1;
    #PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ ';
    if [[ -f "${HOME}/git-prompt.sh" ]]; then
        source ~/git-prompt.sh
        PS1='| \h (\w)$(__git_ps1 " {%s}") | ';
    else
        PS1='|  (\w) | > ';
    fi
    clear;
    HOST=$(hostname);
    if [[ ${#HOST} -lt 14 ]]; then
        echo -e "${lightgray}";figlet -c "$(hostname)";
    fi
    echo ""
    echo -ne "${red}Today is:\\t\\t${cyan} $(date)";
    echo ""
    echo -e "${red}Kernel Information: \\t${cyan} $(uname -smr)"
    echo -ne "${cyan}";
    upinfo;
    echo "";
    echo -e "Welcome to $(hostname), $(whoami)!";
    echo -e;
    fortune;
}

function haste() {
    a=$(cat);
    curl -X POST -s -d "$a" http://haste.akhilnarang.me/documents | awk -F '"' '{print "http://haste.akhilnarang.me/"$4}';
}