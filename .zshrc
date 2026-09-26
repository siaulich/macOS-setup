# --------------------------------------
# Aliases
# --------------------------------------
alias gloa='git log --oneline --graph --all'
alias ls='ls -G'
alias anaconda='source ~/.conda.zshrc'
alias clear="clear && printf '\e[3J'"
# --------------------------------------
# Colors
# --------------------------------------
autoload -U colors && colors

# --------------------------------------
# Zsh completion setup (classic behavior)
# --------------------------------------
autoload -Uz compinit && compinit -C

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Horizontal completion menu
zstyle ':completion:*' menu select=long-list
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*:matches' format ' %B%d%b'
zstyle ':completion:*' format '%d'
zstyle ':completion:*' verbose yes

# --------------------------------------
# Plugins
# --------------------------------------
# Autosuggestions and Syntax Highlighting
HOMEBREW_PREFIX="/opt/homebrew"
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

# --------------------------------------
# Source only local files
# --------------------------------------
_zsh_source_files() {
    _files -g '*' -W "$PWD" -/   # -/ includes directories
}
compdef _zsh_source_files source


# --------------------------------------
# Prompt helpers
# --------------------------------------
env_info() {
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        echo "%B%{$fg[green]%}[conda:${CONDA_DEFAULT_ENV}]%{$reset_color%}%b "
    elif [[ -n "$VIRTUAL_ENV" ]]; then
        echo "%B%{$fg[yellow]%}[$(basename "$VIRTUAL_ENV")]%{$reset_color%}%b "
    fi
}

git_info() {
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    branch="${ref#refs/heads/}"
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        echo "%{$fg[red]%}(${branch})%{$reset_color%} "
    else
        echo "%{$fg[green]%}(${branch})%{$reset_color%} "
    fi
}

precmd() {
    if [[ -n $SSH_CONNECTION ]]; then
        host="%{$fg[blue]%}%m%{$reset_color%}"
    else
        host="%{$fg[blue]%}local%{$reset_color%}"
    fi

    PS1="%{$fg[magenta]%}%n%{$reset_color%}@$host \
%{$fg[cyan]%}%~%{$reset_color%} $(env_info)$(git_info)%% "
}