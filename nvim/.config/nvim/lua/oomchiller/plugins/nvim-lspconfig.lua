return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"b0o/schemastore.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local puppet = require("oomchiller.core.utils.puppet")
		local schemastore = require("schemastore")
		local mason_path = vim.fn.stdpath("data") .. "/mason"
		local ignored_puppet_diagnostic_codes = puppet.ignored_diagnostics()
		local yaml_schemas = schemastore.yaml.schemas()
		yaml_schemas["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/master-standalone-strict/all.json"] = {
			"/*.k8s.yaml",
			"/*.k8s.yml",
			"/k8s/**/*.yaml",
			"/k8s/**/*.yml",
			"/kubernetes/**/*.yaml",
			"/kubernetes/**/*.yml",
			"/manifests/**/*.yaml",
			"/manifests/**/*.yml",
		}
		yaml_schemas["https://gitlab.com/gitlab-org/gitlab-foss/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] =
			{
				"/fluxcd/**/.gitlab-ci.yml",
				"/fluxcd/**/.gitlab-ci.yaml",
				"/fluxcd/**/*.gitlab-ci.yml",
				"/fluxcd/**/*.gitlab-ci.yaml",
			}

		-- Markdown
		vim.lsp.config("marksman", {
			capabilities = capabilities,
		})
		vim.lsp.enable("marksman")

		-- Lua
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
		})
		vim.lsp.enable("lua_ls")

		-- HTML
		vim.lsp.config("html", {
			capabilities = capabilities,
		})
		vim.lsp.enable("html")

		-- JSON
		vim.lsp.config("jsonls", {
			capabilities = capabilities,
			settings = {
				json = {
					schemas = schemastore.json.schemas(),
					validate = {
						enable = true,
					},
				},
			},
		})
		vim.lsp.enable("jsonls")

		-- XML
		vim.lsp.config("lemminx", {
			capabilities = capabilities,
		})
		vim.lsp.enable("lemminx")

		-- YAML
		vim.lsp.config("yamlls", {
			capabilities = capabilities,
			settings = {
				yaml = {
					keyOrdering = false,
						schemaStore = {
							enable = false,
							url = "",
						},
						schemas = yaml_schemas,
					},
				redhat = {
					telemetry = {
						enabled = false,
					},
				},
			},
		})
		vim.lsp.enable("yamlls")

		-- Ansible
		vim.lsp.config("ansiblels", {
			capabilities = capabilities,
			filetypes = { "yaml.ansible", "ansible" },
		})
		vim.lsp.enable("ansiblels")

		-- Helm
		vim.lsp.config("helm_ls", {
			capabilities = capabilities,
		})
		vim.lsp.enable("helm_ls")

		-- Puppet
		vim.lsp.config("puppet", {
			capabilities = capabilities,
			cmd = {
				mason_path .. "/bin/puppet-languageserver",
				"--stdio",
			},
			cmd_env = {
				RBENV_VERSION = "3.2.10",
			},
			handlers = {
				["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
					if result and result.diagnostics then
						result.diagnostics = vim.tbl_filter(function(diagnostic)
							return not ignored_puppet_diagnostic_codes[diagnostic.code]
						end, result.diagnostics)
					end

					return vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
				end,
			},
		})
		vim.lsp.enable("puppet")

		-- Disable standalone RuboCop LSP. Ruby diagnostics are provided via bundle exec rubocop.
		vim.lsp.config("rubocop", {
			autostart = false,
			enabled = false,
		})

		-- Ruby
		vim.lsp.config("solargraph", {
			capabilities = capabilities,
			settings = {
				solargraph = {
					diagnostics = false,
					formatting = false,
				},
			},
		})
		vim.lsp.enable("solargraph")

		-- Python
		vim.lsp.config("basedpyright", {
			capabilities = capabilities,
			settings = {
				basedpyright = {
					analysis = {
						typeCheckingMode = "standard",
					},
				},
			},
		})
		vim.lsp.enable("basedpyright")

		-- Terraform / HCL
		vim.lsp.config("terraformls", {
			capabilities = capabilities,
			filetypes = { "terraform", "terraform-vars", "hcl" },
		})
		vim.lsp.enable("terraformls")

		-- Dockerfile
		vim.lsp.config("dockerls", {
			capabilities = capabilities,
		})
		vim.lsp.enable("dockerls")

		-- Docker Compose
		vim.lsp.config("docker_compose_language_service", {
			capabilities = capabilities,
		})
		vim.lsp.enable("docker_compose_language_service")

		-- Bash
		vim.lsp.config("bashls", {
			capabilities = capabilities,
			filetypes = { "sh", "zsh", "bash" },
		})
		vim.lsp.enable("bashls")
	end,
}
