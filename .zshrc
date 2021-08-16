# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/errxr/.oh-my-zsh"

export SUDO_PROMPT=$'Password for ->\033[32;05;16m %u\033[0m  '

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="flazz"
set -k                     # Allow comments in shell
setopt auto_cd             # cd by just typing the directory name

setopt NO_NOMATCH # disable some globbing
CASE_SENSITIVE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"


#
# Colorize manpages
#
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}


## command for listing path candidates.
## - The first argument to the function ($1) is the base path to start traversal
## - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

command_not_found_handler() {
    printf 'Command not found ->\033[32;05;16m %s\033[0m \n' "$0" >&2
    return 127
}

plugins=(
    git
    dotenv
    zsh-syntax-highlighting
    fzf-tab
    npm
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


#
# FZF
#
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh


alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
        export FZF_DEFAULT_OPTS='
        --color fg:#ffffff,bg:,hl:#A3BE8C,fg+:#D8DEE9,bg+:#131A21,hl+:#A3BE8C,border:#3b4b58
        --color pointer:#f9929b,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#9ce5c0,marker:#EBCB8B
        '


FZF_TAB_COMMAND=(
	fzf
	--ansi   # Enable ANSI color support, necessary for showing groups
	--expect='$continuous_trigger' # For continuous completion
	--color=dark
	--nth=2,3 --delimiter='\x00'  # Don't search prefix
	--layout=reverse --height='${FZF_TMUX_HEIGHT:=75%}'
	--tiebreak=begin -m --bind=tab:down,btab:up,change:top,ctrl-space:toggle --cycle
	'--query=$query'   # $query will be expanded to query string at runtime.
	'--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
)
zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND


FZF_TAB_COMMAND=(
    fzf
    --ansi
    --expect='$continuous_trigger' # For continuous completion
    --nth=2,3 --delimiter='\x00'  # Don't search prefix
    --layout=reverse --height="''${FZF_TMUX_HEIGHT:=50%}"
    --tiebreak=begin -m --bind=tab:down,btab:up,change:top,ctrl-space:toggle --cycle
    '--query=$query'   # $query will be expanded to query string at runtime.
    '--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
)
zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:*:*' fzf-preview '$HOME/.bin/preview.sh $realpath'
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --icons --color-scale --tree -D $realpath'
# vscode previews for files
zstyle ':fzf-tab:complete:code:**' fzf-preview 'bat $realpath || exa --icons --color-scale --tree -D $realpath'


# Set PATH so it includes user's private bin directories
export PATH="${HOME}/.bin:${HOME}/.local/bin:${HOME}/go/bin:${HOME}/.emacs.d/bin/:${PATH}"

autoload -U compinit && compinit