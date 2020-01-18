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
export EDITOR="nano"
export BROWSER="chromium"
export LLVM_ENABLE_THREADS=ON
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true
export CCACHE_EXEC=/usr/bin/ccache

#export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

#export PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
##export PS1="\n\[\033[1;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;34m\]\u@\h'; fi)\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\$?\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\@ \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -sh | head -n1 | sed 's/total //')b\[\033[1;37m\])\342\224\200> \[\033[0m\]"
##export PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"

#export PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;31m\]\u\[\033[0;37m\]@\[\033[0;37m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;31m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"

#export PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]]; echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;31m\]\u\[\033[0;37m\]@\[\033[0;37m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
#export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
#export PS1="\[\e[0m\][\[\033[1;30m\]\d \T\[\e[0m\]]\[\e[0m\]{\[\033[1;30m\]\#\[\e[0m\]} \[\e[0m\]\[\e[0;92m\]\u@\h\[\e[0m\]:\[\e[0;94m\]\w\[\033[1;30m\](\`if [ \$? = 0 ]; then echo \"\[\e[0;92m\]\342\234\223\[\e[0m\]\"; else echo \"\[\e[0;91m\]\342\234\227\[\e[0m\]\"; fi\`\[\033[1;30m\])\[\e[0m\]$ "

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"