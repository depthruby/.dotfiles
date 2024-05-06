# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ruby/.zshrc'

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:' formats '%b '

# End of lines added by compinstall
source ./antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting


antigen apply

alias vim="nvim" 
alias lg="lazygit"
alias ld="lazydocker"
alias gs="git status"
alias gf="git fetch"
alias gp="git pull"
alias ga="git add ."
alias gc="git commit"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt MENU_COMPLETE 

# ~/.zshrc

export EDITOR=nvim
export VISUAL="$EDITOR"
# Find and set branch name var if in git repository.
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}


COLOR_DEF=$'%f'
COLOR_USR=$'%F{green}'
COLOR_DIR=$'%F{blue}'
COLOR_GIT=$'%F{red}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} %F{blue}> '
autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
