local icons = require("oomchiller.core.utils.icons")

local diagnostics = {
	[vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
	[vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
	[vim.diagnostic.severity.INFO] = icons.diagnostics.info,
	[vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
}

vim.diagnostic.config({
	severity_sort = true,
	float = {
		show_header = true,
		source = "always",
		suffix = "",
	},
	signs = {
		text = diagnostics,
	},
	virtual_text = {
		prefix = "",
		spacing = 4,
		severity = {
			min = vim.diagnostic.severity.WARN,
		},
		format = function(diagnostic)
			local symbols = diagnostics
			local message = diagnostic.message
			local severity = diagnostic.severity

			return string.format("%s %s ", symbols[severity], message)
		end,
		signs = true,
		update_in_insert = false,
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})
