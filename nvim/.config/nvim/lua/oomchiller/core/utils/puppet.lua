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

function P.lsp_cmd_env()
	local current_ruby = vim.env.RBENV_VERSION

	if current_ruby and current_ruby ~= "" then
		return {
			RBENV_VERSION = current_ruby,
		}
	end

	if vim.fn.executable("rbenv") ~= 1 then
		return nil
	end

	for _, version in ipairs(vim.fn.systemlist({ "rbenv", "versions", "--bare" })) do
		if version == "3.2.10" then
			return {
				-- puppet 8.10 currently crashes on Ruby 3.4 during LSP bootstrap.
				RBENV_VERSION = version,
			}
		end
	end

	return nil
end

return P
