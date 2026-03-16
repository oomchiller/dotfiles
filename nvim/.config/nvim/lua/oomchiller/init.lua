require("oomchiller.bootstrap.lazy").setup()

local plugins = require("oomchiller.plugins")

require("lazy").setup(plugins, {
	ui = {
		border = "rounded",
		size = {
			width = 0.6,
			height = 0.8,
		},
		backdrop = 0,
	},
})

require("oomchiller.core")
