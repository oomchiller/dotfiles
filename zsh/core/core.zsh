# PATH
typeset -U path PATH
path=(
	"$HOME/.local/bin"
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

zcreset() {
	rm -f \
		"$ZSH_COMPLETIONS_DIR"/_{docker,k9s,kubectl,oc,podman} \
		"$HOME/.cache/zsh/.zcompdump" \
		"$HOME/.zcompdump"
	source "$HOME/.zshrc"
}

# Homebrew shell integrations
if command -v brew >/dev/null 2>&1; then
	eval "$(brew shellenv)"

	BREW_PREFIX="$(brew --prefix 2>/dev/null)"
	ZSH_SYNTAX_HIGHLIGHTING="$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	ZSH_AUTOSUGGESTIONS="$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

	[[ -f "$ZSH_SYNTAX_HIGHLIGHTING" ]] && source "$ZSH_SYNTAX_HIGHLIGHTING"
	[[ -f "$ZSH_AUTOSUGGESTIONS" ]] && source "$ZSH_AUTOSUGGESTIONS"
fi
