#
# ~/.bashrc
#
#
# Shell is non-interactive. Be done now!
if [[ $- != *i* ]] ; then
return
fi

if [ -f $HOME/Github/Scripts/Linux/Shells/shell_sources ]; then
   source $HOME/Github/Scripts/Linux/Shells/shell_sources
fi

# Displays MOTD/Banner when opening new terminal
$HOME/Github/Scripts/Linux/Shells/shell_banner

#########
#EXPORTS#
#########
export LANGUAGE="en"
export LANG="C"
export LC_MESSAGES="C"
export LC_ALL="C"
export USE_CCACHE=1
export USE_NINJA=false
export EDITOR="nano";
export BROWSER="chromium";
#export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# Bash-it
#export BASH_IT="${HOME}/.bash_it"
#export BASH_IT_THEME='powerline'
#export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
#source "$BASH_IT"/bash_it.sh

export PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;31m\]\u\[\033[0;37m\]@\[\033[0;37m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;37m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
#export PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;31m\]\u\[\033[0;37m\]@\[\033[0;37m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;31m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
#export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"
