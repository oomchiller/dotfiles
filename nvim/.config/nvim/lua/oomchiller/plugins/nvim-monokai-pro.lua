return {
	"loctvl842/monokai-pro.nvim",
	priority = 1000,
	config = function()
		local palette = {
			dark2 = "#161821",
			dark1 = "#1e1f2b",
			background = "#282a3a",
			text = "#eaf2f1",
			accent1 = "#ff657a",
			accent2 = "#ff9b5e",
			accent3 = "#ffd76d",
			accent4 = "#bad761",
			accent5 = "#9cd1bb",
			accent6 = "#c39ac9",
			dimmed1 = "#b2b9bd",
			dimmed2 = "#888d94",
			dimmed3 = "#696d77",
			dimmed4 = "#535763",
			dimmed5 = "#3a3d4b",
		}

		require("monokai-pro").setup({
			filter = "ristretto",
			terminal_colors = true,
			devicons = true,
			inc_search = "background",
			background_clear = {},
			overridePalette = function()
				return palette
			end,
			override = function(c)
				return {
					CursorColumn = { bg = c.base.dimmed5 },
					CursorLine = { bg = c.base.dimmed5 },
					NonText = { fg = c.base.dimmed4 },
					SpecialKey = { fg = c.base.dimmed4 },
					Whitespace = { fg = c.base.dimmed4 },
					ColorColumn = { bg = c.base.dimmed4 },
					NormalFloat = { bg = c.base.black },
					FloatBorder = { fg = c.base.dimmed4, bg = c.base.black },
					MsgArea = { fg = c.base.white, bg = palette.dark2 },
					StatusLine = { fg = c.base.white, bg = palette.dark2 },
					StatusLineNC = { fg = c.base.dimmed2, bg = palette.dark2 },
					WinSeparator = { fg = c.base.dimmed4, bg = palette.dark2 },
					TabLine = { fg = c.base.dimmed2, bg = palette.dark2, bold = true },
					TabLineFill = { fg = c.base.white, bg = palette.dark2, bold = true },
					TabLineSel = { fg = c.base.white, bg = c.base.black, bold = true },
					CursorLineNr = { fg = c.base.white, bold = true },
					LineNr = { fg = c.base.dimmed4 },
					TreesitterContext = { bg = palette.dark2 },
					TreesitterContextLineNumber = {
						fg = c.base.dimmed4,
						bg = palette.dark2,
					},
					TreesitterContextSeparator = { fg = c.base.dimmed4 },
					NvimTreeModifiedIcon = { fg = c.base.white },
					NvimTreeGitStagedIcon = { fg = c.base.green },
					NvimTreeGitDeletedIcon = { fg = c.base.red },
					NvimTreeGitDirtyIcon = { fg = c.base.yellow },
					NvimTreeNormal = { bg = c.base.black },
					NvimTreeWinSeparator = { fg = c.base.black, bg = c.base.black },
					NvimTreeStatusLine = { bg = c.base.black },
					NvimTreeStatusLineNC = { bg = c.base.black },
				}
			end,
		})

		vim.cmd.colorscheme("monokai-pro")
	end,
}
