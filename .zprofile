# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"
if [ -f "$HOME/.TerminalTweaksMACOS" ]; then
    source "$HOME/.TerminalTweaksMACOS"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
    export PATH="$HOME/bin/vsphere:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [[ $(which go) ]]; then
  export PATH="$HOME/go/bin:$PATH"
fi

if [[ $(which cargo) ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ -d $HOME/.krew/bin ]]; then
  export PATH="$HOME/.krew/bin:$PATH"
fi

export HELM_DIFF_COLOR=true

export PATH=$PATH:$HOME/.krew/bin
export PATH=$PATH:/opt/mssql-tools/bin

export CM_LAUNCHER=rofi
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BROWSER=/usr/bin/firefox
export EDITOR=nvim

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"
