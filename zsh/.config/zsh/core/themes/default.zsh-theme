base_prompt(){
	print -rn -- "%F{$1}$2%f"
}

bold_prompt(){
	print -rn -- "%B%F{$1}$2%f%b"
}

user_prompt(){
	if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		bold_prompt "cyan" " %n@%m "
	fi
}

dir_prompt(){
	local folder_icon=""

	if [[ "$HOME" = "$(pwd)" ]]; then
		folder_icon=""
	fi

	local cwd=" %~ "
	local result=$folder_icon$cwd

	bold_prompt "blue" $result
}

git_prompt(){
	local branch branch_color dirty_color branch_icon dirty

	command git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

	branch="$(command git symbolic-ref --quiet --short HEAD 2>/dev/null)" \
		|| branch="$(command git rev-parse --short HEAD 2>/dev/null)" \
		|| return

	branch_color="magenta"
	dirty_color="red"
	branch_icon=" "
	dirty=0

	command git diff --no-ext-diff --quiet --ignore-submodules HEAD -- 2>/dev/null || dirty=1

	bold_prompt "$branch_color" "$branch_icon$branch"
	(( dirty )) && bold_prompt "$dirty_color" "*"
	base_prompt "$branch_color" " "
}

finish_prompt(){
	local newline=$'\n󱦰 '
	base_prompt "8" "$newline"
}

build_prompt() {
	user_prompt
	dir_prompt
	git_prompt
	finish_prompt
}

PROMPT='$(build_prompt)'
