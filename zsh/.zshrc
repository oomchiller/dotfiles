export EDITOR="nano"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export DEFAULT_USER="$(whoami)"

export ZSH_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export ZSH_COMPLETIONS_DIR="$HOME/.zsh/completions"
export ZSH_COMPDUMP_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP_FILE="$ZSH_COMPDUMP_DIR/.zcompdump"
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export ZSH_CUSTOM="$ZSH_CONFIG_HOME/oh-my-zsh"
export ZSH_CACHE_DIR="$ZSH_COMPDUMP_DIR/oh-my-zsh"
export ZSH_COMPDUMP="$ZSH_COMPDUMP_FILE"
export ZSH_LOCAL_FILE="$ZSH_CONFIG_HOME/local.zsh"
export DISABLE_AUTO_UPDATE=true
export ZSH_THEME="af-magic"
plugins=()

autoload -U colors && colors
setopt PROMPT_SUBST

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
# Use ANSI colors so the shell follows the terminal theme palette instead of fixed RGB values.
export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=32:bd=33;1:cd=33;1:*.zip=31:*.tar=31:*.gz=31:*.bz2=31:*.xz=31:*.7z=31:*.jpg=35:*.jpeg=35:*.png=35:*.gif=35:*.webp=35:*.tiff=35:*.mp4=35:*.mkv=35:*.avi=35:*.mp3=33:*.flac=33:*.wav=33:*.html=33:*.htm=33:*.c=36:*.cpp=36:*.h=36:*.hpp=36:*.py=32:*.ts=34:*.tsx=34:*.rs=31:*.go=36:*.java=31:*.sh=32:*.json=33:*.yaml=33:*.yml=33:*.toml=33:*.ini=33:*.md=36:*.txt=37:*.pdf=35:*.po=35:*.lock=90"

HISTFILE=$HOME/.zsh_history
SAVEHIST=50000
HISTSIZE=50000

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_fcntl_lock
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_verify
unsetopt share_history

source "$ZSH_CONFIG_HOME/core/core.zsh"
source "$ZSH_CONFIG_HOME/core/completions.zsh"

for aliases_file in \
	"$ZSH_CONFIG_HOME/core/aliases/main.zsh" \
	"$ZSH_CONFIG_HOME/core/aliases/git.zsh" \
	"$ZSH_CONFIG_HOME/core/aliases/k8s.zsh" \
	"$ZSH_CONFIG_HOME/core/aliases/tmux.zsh"
do
	source "$aliases_file"
done

if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
	mkdir -p "$ZSH_CACHE_DIR"
	source "$ZSH/oh-my-zsh.sh"
else
	source "$ZSH_CONFIG_HOME/core/themes/default.zsh-theme"
	autoload -Uz compinit
	compinit -d "$ZSH_COMPDUMP"
fi

for kubectl_alias in k kg kd ka kdel kl kf ke kcp kctx kcc kns kgp kgd kgds kgs kging kgcm kgsec kgj kgy
do
	compdef _kubectl "$kubectl_alias"
done

for oc_alias in o op ops oroute onew ob ost ow orsh
do
	compdef _oc "$oc_alias"
done

compdef _k9s k9

eval "$(zoxide init zsh)"

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

if [[ -o interactive ]]; then
	[[ -f "$FZF_COMPLETION" ]] && source "$FZF_COMPLETION"
	[[ -f "$FZF_KEY_BINDINGS" ]] && source "$FZF_KEY_BINDINGS"
fi

source "$ZSH_CONFIG_HOME/core/bindkey.zsh"

if [[ -f "$ZSH_LOCAL_FILE" ]]; then
	source "$ZSH_LOCAL_FILE"
fi

[[ -f "$ZSH_AUTOSUGGESTIONS" ]] && source "$ZSH_AUTOSUGGESTIONS"
[[ -f "$ZSH_SYNTAX_HIGHLIGHTING" ]] && source "$ZSH_SYNTAX_HIGHLIGHTING"
