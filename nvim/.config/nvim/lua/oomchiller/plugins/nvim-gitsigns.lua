return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gs = require("gitsigns")
		gs.setup({
			on_attach = function(buffer)
				require("oomchiller.core.settings.keymaps.table").gitsings_keymaps()
			end,
		})
	end,
}
