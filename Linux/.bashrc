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

# Paths
export PATH=$PATH:/home/killerdroid96/ROMs/Developers/Matthew_Keller/Addons
export PATH=$PATH:/home/killerdroid96/ROMs/Developers/Nathan_Chancellor/scripts

# Extras:

#######
#ALIAS#
#######
alias ls="ls --color=auto" 
alias ll="ls --color -al" 
alias grep='grep --color=auto' 
alias editbash='nano ~/.bashrc'
alias updatebash='source ~/.bashrc'
alias hs='history | grep' # hs history displays comand history, use !208 etc to repeat command
alias XPS15='ssh killerdroid96@192.168.1.90' #SSH
alias c="clear"
alias cmount="mount | column -t"
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p" 
alias meminfo='free -m -l -t'
alias fps='ps aux | grep'
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'"
alias path="pwd"

###########
#FUNCTIONS#
###########
cl() {
# cd and ls in one
    local dir="$1"
    local dir="${dir:=$HOME}"
    if [[ -d "$dir" ]]; then
        cd "$dir" >/dev/null; ls
    else
        echo "bash: cl: $dir: Directory not found"
    fi
}

calc() {
# terminal calculator
    echo "scale=3;$@" | bc -l
}

ipif() { 
# lists ip, hostname, city, region, country, loc, org, postal
    if grep -P "(([1-9]\d{0,2})\.){3}(?2)" <<< "$1"; then
    curl ipinfo.io/"$1"
    else
    ipawk=($(host "$1" | awk '/address/ { print $NF }'))
    curl ipinfo.io/${ipawk[1]}
    fi
    echo
}

note () {
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
        printf "%s\n" "$*" >> "$HOME/.notes"
    fi
}

numfiles() { 
# numfiles test > 10 files in test
    N="$(ls $1 | wc -l)"; 
    echo "$N files in $1";
}

history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
# history displays comand history, use !208 etc to repeat command

mcd () {
# mcd test, creates and moves into test directory
    mkdir -p $1
    cd $1
}

function search (){
 egrep -roiI $1 . | sort | uniq
}

function whereis (){
  find . -name "$1*";
}

backup() { cp "$1"{,.bak};} # will create [file].bak in the same directory

sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 