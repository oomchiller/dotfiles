local P = {}

P.ignored_check_codes = {
	"80chars",
	"140chars",
	"autoloader_layout",
	"documentation",
	"inherits_across_namespaces",
	"selector_inside_resource",
	"variable_scope",
}

function P.lint_args()
	local args = {}

	for _, code in ipairs(P.ignored_check_codes) do
		table.insert(args, "--no-" .. code .. "-check")
	end

	table.insert(args, "--log-format")
	table.insert(args, "%{path}:%{line}:%{column}:%{kind}:%{check}:%{message}")

	return args
end

function P.ignored_diagnostics()
	local ignored = {}

	for _, code in ipairs(P.ignored_check_codes) do
		ignored[code] = true
	end

	return ignored
end

return P
