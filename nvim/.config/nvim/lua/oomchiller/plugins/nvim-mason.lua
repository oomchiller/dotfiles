return {
	"williamboman/mason.nvim",
	config = function()
		local mason = require("mason")
		local mason_registry = require("mason-registry")

		mason.setup({
			ui = {
				border = "rounded",
				width = 0.6,
				height = 0.8,
			},
		})

		local required_packages = {
			"lua-language-server",
			"html-lsp",
			"marksman",
			"lemminx",
			"json-lsp",
			"yaml-language-server",
			"yamllint",
			"helm-ls",
			"ansible-language-server",
			"ansible-lint",
			"puppet-editor-services",
			"puppet-lint",
			"solargraph",
			"basedpyright",
			"ruff",
			"black",
			"isort",
			"terraform-ls",
			"tflint",
			"prettier",
			"dockerfile-language-server",
			"docker-compose-language-service",
			"hadolint",
			"bash-language-server",
			"shellcheck",
			"shfmt",
			"stylua",
		}

		local function missing_packages()
			local packages = {}

			for _, required_package in ipairs(required_packages) do
				if mason_registry.has_package(required_package) and mason_registry.is_installed(required_package) == false then
					table.insert(packages, required_package)
				end
			end

			return packages
		end

		vim.api.nvim_create_user_command("MasonToolsInstallAll", function()
			local packages = missing_packages()

			if vim.tbl_isempty(packages) then
				vim.notify("All Mason tools are already installed.", vim.log.levels.INFO)
				return
			end

			vim.cmd("MasonInstall " .. table.concat(packages, " "))
		end, {
			desc = "Install missing Mason-managed tools for this config",
		})
	end,
}
