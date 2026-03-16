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
	if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then

		local status_color="#bad761"
		local branch_icon=" "
		local branch=$(git branch --show-current)$' '
		local repository_status

		local git_status=$(git status --porcelain 2> /dev/null)
		if [[ -n "$git_status" ]]; then
			status_color="#ff9b5e"
		fi

		local ahead_icon=$(base_prompt "#9cd1bb" '󱦴')
		local behind_icon=$(base_prompt "#c39ac9" '󱦶')

		local ahead=$(git log --oneline @{upstream}.. 2>/dev/null)
		local behind=$(git log --oneline ..@{upstream} 2>/dev/null)
		if [[ -n "$ahead" ]] && [[ -n "$behind" ]]; then
			repository_status=$behind_icon$ahead_icon
		elif [[ -n "$ahead" ]]; then
			repository_status=$ahead_icon
		elif [[ -n "$behind" ]]; then
			repository_status=$behind_icon
		fi

		local result=$branch_icon$branch$repository_status
		bold_prompt $status_color $result
	fi
}

finish_prompt(){
	NEWLINE=$'\n󱦰 '
	base_prompt "#eaf2f1" $NEWLINE
}

build_prompt() {
	user_prompt
	dir_prompt
	git_prompt
	finish_prompt
}

PROMPT='$(build_prompt)'
