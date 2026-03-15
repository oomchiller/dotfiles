return {
	"stevearc/conform.nvim",
	config = function()
		local project = require("oomchiller.core.utils.project")

		require("conform").setup({
			formatters = {
				rubocop = {
					command = function(_, ctx)
						local cmd = project.bundle_wrap("rubocop", {}, ctx.filename)
						return cmd
					end,
					args = function(_, ctx)
						local _, args = project.bundle_wrap("rubocop", {
							"--server",
							"-a",
							"-f",
							"quiet",
							"--stderr",
							"--stdin",
							"$FILENAME",
						}, ctx.filename)
						return args
					end,
					cwd = function(_, ctx)
						local _, _, root = project.bundle_wrap("rubocop", {}, ctx.filename)
						return root
					end,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				puppet = { "puppet-lint" },
				ruby = { "rubocop" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				["yaml.docker-compose"] = { "prettier" },
				["yaml.helm-values"] = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				dockerfile = { "dockerfmt" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				bash = { "shfmt" },
				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },
				hcl = { "terraform_fmt" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		})
	end,
}
