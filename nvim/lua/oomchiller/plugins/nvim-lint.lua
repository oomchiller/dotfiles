return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		local project = require("oomchiller.core.utils.project")
		local puppet_lint = lint.linters["puppet-lint"]
		local rubocop = lint.linters["rubocop"]
		local yamllint = lint.linters["yamllint"]

		if puppet_lint then
			puppet_lint.args = {
				"--no-80chars-check",
				"--no-140chars-check",
				"--no-autoloader_layout-check",
				"--no-documentation-check",
				"--no-inherits_across_namespaces-check",
				"--no-selector_inside_resource-check",
				"--no-variable_scope-check",
				"--log-format",
				"%{path}:%{line}:%{column}:%{kind}:%{check}:%{message}",
			}
		end

		if rubocop then
			local rubocop_args = {
				"--format",
				"json",
				"--force-exclusion",
				"--server",
				"--stdin",
			}

			lint.linters["rubocop_bundle"] = vim.tbl_deep_extend("force", rubocop, {
				cmd = function()
					local cmd = project.bundle_wrap("rubocop", {}, vim.api.nvim_buf_get_name(0))
					return cmd
				end,
				args = function()
					local filename = vim.api.nvim_buf_get_name(0)
					local _, args = project.bundle_wrap("rubocop", vim.list_extend(vim.deepcopy(rubocop_args), { filename }), filename)
					return args
				end,
				cwd = function()
					local _, _, root = project.bundle_wrap("rubocop", {}, vim.api.nvim_buf_get_name(0))
					return root
				end,
			})
		end

		if yamllint then
			yamllint.args = {
				"--format",
				"parsable",
				"-d",
				"{extends: default, rules: {line-length: disable}}",
				"-",
			}
		end

		lint.linters_by_ft = {
			dockerfile = { "hadolint" },
			puppet = { "puppet-lint" },
			ruby = { "rubocop_bundle" },
			python = { "ruff" },
			yaml = { "yamllint" },
			["yaml.docker-compose"] = { "yamllint" },
			["yaml.helm-values"] = { "yamllint" },
			["yaml.ansible"] = { "ansible_lint" },
			ansible = { "ansible_lint" },
			terraform = { "tflint" },
			tf = { "tflint" },
			hcl = { "tflint" },
			sh = { "shellcheck" },
			bash = { "shellcheck" },
			zsh = { "shellcheck" },
		}

		local lint_events = { "BufReadPost", "BufWritePost", "InsertLeave" }
		vim.api.nvim_create_autocmd(lint_events, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
