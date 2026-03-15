mkdir -p "$ZSH_COMPLETIONS_DIR" "$ZSH_COMPDUMP_DIR"

ensure_completion_file() {
	local target_file="$1"
	shift

	[[ -f "$target_file" ]] && return 0
	command -v "$1" >/dev/null 2>&1 || return 0

	"$@" >"$target_file" 2>/dev/null
}

ensure_completion_copy() {
	local source_file="$1"
	local target_file="$2"

	[[ -f "$target_file" ]] && return 0
	[[ -f "$source_file" ]] || return 0

	cp "$source_file" "$target_file"
}

ensure_completion_file "$ZSH_COMPLETIONS_DIR/_docker" docker docker completion zsh
ensure_completion_file "$ZSH_COMPLETIONS_DIR/_kubectl" kubectl kubectl completion zsh
ensure_completion_file "$ZSH_COMPLETIONS_DIR/_podman" podman podman completion zsh
ensure_completion_file "$ZSH_COMPLETIONS_DIR/_oc" oc oc completion zsh

if command -v brew >/dev/null 2>&1; then
	BREW_COMPLETION_SRC="$(brew --prefix 2>/dev/null)/share/zsh/site-functions/_brew"
	ensure_completion_copy "$BREW_COMPLETION_SRC" "$ZSH_COMPLETIONS_DIR/_brew"
fi

FPATH="$ZSH_COMPLETIONS_DIR:$FPATH"
export FPATH
