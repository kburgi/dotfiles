# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

# oh-my-zsh variable configuration
ZSH_THEME="voltus"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="%d/%m/%y %T"

plugins=(tmux common-aliases git docker colored-man-pages kubectl ubuntu z)
source $ZSH/oh-my-zsh.sh

# Preferred editor
command -v nvim &>/dev/null && export EDITOR='nvim' || export EDITOR='vim'

# fzf scripts
[ -f $HOME/.fzf/shell/completion.zsh ]\
    && source $HOME/.fzf/shell/completion.zsh\
    && [ -f $HOME/.fzf/shell/key-bindings.zsh ]\
    && source $HOME/.fzf/shell/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]\
    && source /usr/share/doc/fzf/examples/key-bindings.zsh\
    && [ -f /usr/share/doc/fzf/examples/completion.zsh ]\
    && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ]\
    && source /usr/share/fzf/key-bindings.zsh\
    && [ -f /usr/share/fzf/completion.zsh ]\
    && source /usr/share/fzf/completion.zsh

if [[ $PATH != *"$HOME/.bin"* ]]; then
    export PATH="$PATH:$HOME/.bin"
fi
if [[ $PATH != *"$HOME/bin"* ]]; then
    export PATH="$PATH:$HOME/bin"
fi
if [[ $PATH != *"$HOME/.cargo/bin"* ]]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi
if [[ $PATH != *"$HOME/.local/bin"* ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

# add fzf to path
# replace cat with bat if bat is installed
export FZF_PREVIEWER="cat"
if command -v bat &> /dev/null; then
    alias bat="bat -pp --color=always"
    alias cat="bat"
    export FZF_PREVIEWER="bat -pp --color=always --line-range :500 {}"
fi

export FZF_DEFAULT_OPTS="--multi --border --preview '$FZF_PREVIEWER' --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"

# check if rg is installed to modify default fzf mapping
if command -v rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg -l ""' # show hidden files in fzf search by default
fi

# alias & additional configuration
alias clear='clear -x'
[ -f ~/.zsh_alias ] && source ~/.zsh_alias

autoload zcalc

#Star Ship
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi
