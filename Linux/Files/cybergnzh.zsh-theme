# Based on bira theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{red}%n%f' 
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%f➤  %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤  %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{white}%M%f' # SSH
else
  PR_HOST='%F{red}%M%f' # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

local user_host="%B[${PR_USER}%B%F{white}@${PR_HOST}]"
local current_dir="[%B%F{white}%~%f%b]"
local git_branch='%B%F$(git_prompt_info)'

PROMPT="╭─${user_host}─${current_dir}─${git_branch} \$(ruby_prompt_info) 
╰─$PR_PROMPT"
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{green}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡%{$reset_color%}"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"

}
