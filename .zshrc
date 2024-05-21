#history file
#export HISTFILE=$HOME/.zsh_history
#set history size
#export HISTSIZE=100000
#save history after logout
#export SAVEHIST=100000
#append into history file
setopt inc_append_history
# delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_expire_dups_first
#add timestamp for each entry
setopt extended_history
#share command history data
setopt share_history
#save only one command if 2 common are same and consistent
setopt hist_ignore_dups
# show command with history expansion to user before running it
setopt hist_verify

setopt shwordsplit

autoload -U promptinit
promptinit
setopt PROMPT_SUBST

setopt interactivecomments

# Keybinding
bindkey -e
bindkey '^i' expand-or-complete-prefix
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kcbt]}" reverse-menu-complete
bindkey "${terminfo[kdch1]}" delete-char

autoload -U select-word-style
select-word-style bash

# Syntax Highlighting
if [ -d /opt/homebrew/share/zsh-syntax-highlighting/ ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[comment]='fg=yellow,bold'
fi

#Command not found
if [[ -f /etc/zsh_command_not_found ]]; then
  . /etc/zsh_command_not_found
fi

# Autosuggestions
if [ -d /opt/homebrew/share/zsh-autosuggestions/ ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# History substring search
if [ -d /opt/homebrew/share/zsh-history-substring-search/ ]; then
    source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    
    bindkey "$terminfo[kcuu1]" history-substring-search-up
    bindkey "$terminfo[kcud1]" history-substring-search-down
fi

source ~/.zprofile
#eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
eval "$(zoxide init zsh)"

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
#export TERM=screen-256color

#if which tmux > /dev/null 2>&1; then
#  test -z ${TMUX} && exec tmux

 ## attach to sessions that might exist on exit
 # while test -z ${TMUX}; do
 #   tmux attach || break
 # done
#fi

#source <(helm completion zsh)
#source <(kubectl completion zsh)
#kubectl completion zsh > "/usr/share/zsh/site-functions/_kubectl"
if [[ -f $HOME/.stern_completion ]]; then
  source $HOME/.stern_completion
fi

if [[ -f $HOME/.kubectl-completion-zsh ]]; then
  source $HOME/.kubectl-completion-${SHELL##*/}
fi

if [[ -f $HOME/.kubecm-completion-zsh ]]; then
  source $HOME/.kubecm-complete-${SHELL##*/}
fi

if [[ -f $HOME/.k9s-completion-zsh ]]; then
  source $HOME/.k9s-completion-${SHELL##*/}
fi

. $HOME/.commonrc
PROMPT='$(gbt $?)'
RPROMPT='$(gbt -right)'

#ASDF configuration

#. "$HOME/.asdf/asdf.sh"
# append completions to fpath
#fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/eabdulrahman/bin/mc mc

zstyle ':completion:*' menu select
fpath+=~/.zfunc

# source /home/eabdulrahman/.config/broot/launcher/bash/br
