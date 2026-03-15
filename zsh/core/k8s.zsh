__kubectl_bin() {
	if command -v kubecolor >/dev/null 2>&1; then
		printf '%s\n' kubecolor
		return 0
	fi

	printf '%s\n' kubectl
}

__stream_with_bat() {
	local language="$1"

	if command -v bat >/dev/null 2>&1 && [[ -t 1 ]]; then
		bat --language="$language" --paging=never --style=plain
		return 0
	fi

	cat
}

__render_yaml() {
	if command -v yq >/dev/null 2>&1; then
		yq eval -P -
	else
		cat
	fi | __stream_with_bat yaml
}

__render_json() {
	if command -v jq >/dev/null 2>&1; then
		jq .
	else
		cat
	fi | __stream_with_bat json
}

k() {
	command "$(__kubectl_bin)" "$@"
}

o() {
	command oc "$@"
}

ky() {
	k get "$@" -o yaml | __render_yaml
}

kj() {
	k get "$@" -o json | __render_json
}

oy() {
	o get "$@" -o yaml | __render_yaml
}

oj() {
	o get "$@" -o json | __render_json
}

kev() {
	k get events --sort-by=.lastTimestamp "$@"
}

oev() {
	o get events --sort-by=.lastTimestamp "$@"
}

kimg() {
	if ! command -v jq >/dev/null 2>&1; then
		k get "$@" -o json
		return 0
	fi

	k get "$@" -o json | jq -r '
		[
			.items[]?.spec.initContainers[]?.image,
			.items[]?.spec.containers[]?.image,
			.items[]?.spec.template.spec.initContainers[]?.image,
			.items[]?.spec.template.spec.containers[]?.image,
			.spec.initContainers[]?.image,
			.spec.containers[]?.image,
			.spec.template.spec.initContainers[]?.image,
			.spec.template.spec.containers[]?.image
		]
		| flatten
		| .[]
		| select(. != null and . != "")
	' | sort -u
}

oimg() {
	if ! command -v jq >/dev/null 2>&1; then
		o get "$@" -o json
		return 0
	fi

	o get "$@" -o json | jq -r '
		[
			.items[]?.spec.initContainers[]?.image,
			.items[]?.spec.containers[]?.image,
			.items[]?.spec.template.spec.initContainers[]?.image,
			.items[]?.spec.template.spec.containers[]?.image,
			.spec.initContainers[]?.image,
			.spec.containers[]?.image,
			.spec.template.spec.initContainers[]?.image,
			.spec.template.spec.containers[]?.image
		]
		| flatten
		| .[]
		| select(. != null and . != "")
	' | sort -u
}

kst() {
	command stern "$@"
}
