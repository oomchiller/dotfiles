return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local ok, configs = pcall(require, "nvim-treesitter.configs")
		if not ok then
			return
		end

		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"html",
				"xml",
				"json",
				"yaml",
				"helm",
				"toml",
				"dockerfile",
				"hcl",
				"terraform",
				"puppet",
				"ruby",
				"python",
			},
			sync_install = true,
			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "puppet" },
			},
		})
	end,
}
