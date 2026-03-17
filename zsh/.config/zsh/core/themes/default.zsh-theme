base_prompt(){
	print -rn -- "%F{$1}$2%f"
}

bold_prompt(){
	print -rn -- "%B%F{$1}$2%f%b"
}

user_prompt(){
	if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
		bold_prompt "#9cd1bb" " %n@%m "
	fi
}

dir_prompt(){
	local folder_icon=""

	if [[ "$HOME" = "$(pwd)" ]]; then
		folder_icon=""
	fi

	local cwd=" %~ "
	local result=$folder_icon$cwd

	bold_prompt "#ffd76d" $result
}

git_prompt(){
	local git_status branch status_color branch_icon line

	git_status=$(command git status --porcelain=2 --branch --untracked-files=no 2>/dev/null) || return
	[[ -n "$git_status" ]] || return

	status_color="#bad761"
	branch_icon=" "

	for line in ${(f)git_status}; do
		if [[ "$line" == '# branch.head '* ]]; then
			branch="${line#\# branch.head }"
		elif [[ "$line" != '# '* ]]; then
			status_color="#ff9b5e"
		fi
	done

	[[ "$branch" = "(detached)" ]] && branch="detached"
	[[ -z "$branch" ]] && return

	bold_prompt "$status_color" "$branch_icon$branch "
}

finish_prompt(){
	local newline=$'\n󱦰 '
	base_prompt "#eaf2f1" "$newline"
}

build_prompt() {
	user_prompt
	dir_prompt
	git_prompt
	finish_prompt
}

PROMPT='$(build_prompt)'
