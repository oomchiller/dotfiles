export EDITOR=v
export DEFAULT_USER="$(whoami)"

export ZSH_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ZSH_COMPLETIONS_DIR="$HOME/.zsh/completions"
export ZSH_COMPDUMP_DIR="$HOME/.cache/zsh"
export ZSH_COMPDUMP_FILE="$ZSH_COMPDUMP_DIR/.zcompdump"

autoload -U colors && colors
setopt PROMPT_SUBST
source "$ZSH_CONFIG_HOME/core/themes/default.zsh-theme"

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxAgAdXbAgAcAd
export LS_COLORS="di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=1;30;46:cd=1;30;43:su=1;0;41:sg=1;30;46:tw=1;30;42:ow=1;30;43"

HISTFILE=$HOME/.zsh_history
SAVEHIST=10000
HISTSIZE=10000

setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

source "$ZSH_CONFIG_HOME/core/core.zsh"
source "$HOME/.config/zsh/local.zsh" 2>/dev/null || true

for aliases_file in \
	"$ZSH_CONFIG_HOME/core/aliases/main.zsh" \
	"$ZSH_CONFIG_HOME/core/aliases/git.zsh" \
	"$ZSH_CONFIG_HOME/core/aliases/eza.zsh" \
	"$ZSH_CONFIG_HOME/core/aliases/k8s.zsh" \
	"$ZSH_CONFIG_HOME/core/aliases/tmux.zsh"
do
	source "$aliases_file"
done

source "$ZSH_CONFIG_HOME/core/completions.zsh"
autoload -Uz compinit
compinit -d "$ZSH_COMPDUMP_FILE"

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

source "$ZSH_CONFIG_HOME/core/bindkey.zsh"
