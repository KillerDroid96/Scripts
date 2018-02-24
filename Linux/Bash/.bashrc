#
# ~/.bashrc
#
#
# Shell is non-interactive. Be done now!

if [[ $- != *i* ]] ; then
return
fi

# Bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f $HOME/Github/Scripts/Linux/Bash/.bash_commands ]; then
    source $HOME/Github/Scripts/Linux/Bash/.bash_commands
fi
 
if [ -f $HOME/Github/Scripts/Linux/Bash/.bash_colors ]; then
   source $HOME/Github/Scripts/Linux/Bash/.bash_colors
fi

if [ -f $HOME/Github/Scripts/Linux/Bash/.bash_others ]; then
   source $HOME/Github/Scripts/Linux/Bash/.bash_others
fi

#PS1='[\u@\h \W]\$ ' # Defaults
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano

/etc/profile.d/motd.sh # Displays MOTD/Banner when opening new terminal

# shopt options
shopt -s cdspell # This will correct minor spelling errors in a cd command.
shopt -s histappend # Append to history rather than overwrite
shopt -s checkwinsize # Check window after each command
shopt -s dotglob # files beginning with . to be returned in the results of path-name expansion.