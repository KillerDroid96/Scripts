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
export LC_ALL="C"
export USE_CCACHE=1
export USE_NINJA=false
export EDITOR="nano";
export BROWSER="chromium";

# Bash-it
#export BASH_IT="${HOME}/.bash_it"
#export BASH_IT_THEME='powerline'
#export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
#source "$BASH_IT"/bash_it.sh