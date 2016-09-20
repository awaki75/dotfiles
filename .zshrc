. ~/.zplug/init.zsh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt auto_pushd
setopt complete_in_word
setopt extended_history
setopt prompt_subst
setopt pushd_ignore_dups

autoload -Uz colors && colors
autoload -Uz compinit && compinit

zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
zstyle ":completion:*" menu select=2
zstyle ":completion:*" use-cache true
zstyle ":completion:*:sudo:*" command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug check || zplug install
zplug load

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# show_opt() { set -o | sed "s/^no\(.*\)on$/\1  off/;s/^no\(.*\)off$/\1  on/" }

git_current_branch() {
    local ref
    ref=$(git symbolic-ref --quiet HEAD 2> /dev/null)
    local ret=$?
    if [[ $ret != 0 ]]; then
        [[ $ret == 128 ]] && return  # no git repo.
        ref=$(git rev-parse --short HEAD 2> /dev/null) || return
    fi
    echo ${ref#refs/heads/}
}

git_info() {
    local branch=$(git_current_branch)
    [[ -z $branch ]] && return
    local modification=$(echo $(git status --porcelain 2> /dev/null | wc -l))
    echo " %F{yellow}$branch($modification)%f"
}

PROMPT="%F{cyan}[%*]%f %F{green}%~%f\$(git_info)$ "

alias g="git"
alias ga="git add"
alias gb="git branch"
alias gcm="git checkout master"
alias gco="git checkout"
alias gd="git diff"
alias ggpush="git push origin $(git_current_branch)"
alias glg="git log --stat"
alias glog="git log --oneline --decorate --graph"
alias gst="git status"
alias la="ls -lA"
alias ll="ls -l"

if [ $(uname) = "Darwin" ]; then
    alias ls="ls -G"
else
    alias ls="ls --color=auto"
fi
