# PATH
typeset -U path PATH
path=(
	"$HOME/.local/bin"
	/opt/homebrew/opt/ruby/bin
	/usr/local/opt/ruby/bin
	/opt/homebrew/bin
	/usr/local/bin
	/System/Cryptexes/App/usr/bin
	/usr/bin
	/bin
	/usr/sbin
	/sbin
	$path
)
export PATH

# Docker
[[ -s "$HOME/.docker/init-zsh.sh" ]] && source "$HOME/.docker/init-zsh.sh"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# K9s
export K9S_CONFIG_DIR="$HOME/.config/k9s"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]="none"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=red"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[alias]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=blue"
ZSH_HIGHLIGHT_STYLES[function]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[command]="fg=green"
ZSH_HIGHLIGHT_STYLES[path]="fg=cyan,underline"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[comment]="fg=8"
ZSH_HIGHLIGHT_STYLES[bracket-level-1]="bold"

zcreset() {
	rm -f \
		"$ZSH_COMPLETIONS_DIR"/_{docker,k9s,kubectl,oc,podman} \
		"$ZSH_COMPDUMP"
	exec zsh
}

brew_prefix() {
	local brew_path
	brew_path="$(command -v brew 2>/dev/null)" || return 1
	dirname "$(dirname "$brew_path")"
}

# Homebrew shell integrations
if command -v brew >/dev/null 2>&1; then
	BREW_PREFIX="$(brew_prefix)"
	FZF_KEY_BINDINGS="$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
	FZF_COMPLETION="$BREW_PREFIX/opt/fzf/shell/completion.zsh"
	ZSH_SYNTAX_HIGHLIGHTING="$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	ZSH_AUTOSUGGESTIONS="$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
