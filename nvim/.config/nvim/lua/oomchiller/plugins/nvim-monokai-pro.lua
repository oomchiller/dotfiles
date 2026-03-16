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
					Normal = { fg = c.base.white, bg = "NONE" },
					NormalNC = { fg = c.base.white, bg = "NONE" },
					NormalSB = { fg = c.base.white, bg = "NONE" },
					NormalFloat = { bg = "NONE" },
					FloatBorder = { fg = c.base.dimmed4, bg = "NONE" },
					FloatTitle = { fg = c.base.white, bg = "NONE", bold = true },
					SignColumn = { bg = "NONE" },
					FoldColumn = { bg = "NONE" },
					EndOfBuffer = { fg = c.base.dimmed5, bg = "NONE" },
					MsgArea = { fg = c.base.white, bg = "NONE" },
					CursorColumn = { bg = c.base.dimmed5 },
					CursorLine = { bg = c.base.dimmed5 },
					CursorLineNr = { fg = c.base.white, bold = true },
					CursorLineSign = { bg = c.base.dimmed5 },
					CursorLineFold = { bg = c.base.dimmed5 },
					NonText = { fg = c.base.dimmed4 },
					SpecialKey = { fg = c.base.dimmed4 },
					Whitespace = { fg = c.base.dimmed4 },
					ColorColumn = { bg = c.base.dimmed4 },
					StatusLine = { fg = c.base.white, bg = "NONE" },
					StatusLineNC = { fg = c.base.dimmed2, bg = "NONE" },
					WinSeparator = { fg = c.base.dimmed4, bg = "NONE" },
					TabLine = { fg = c.base.dimmed2, bg = "NONE", bold = true },
					TabLineFill = { fg = c.base.white, bg = "NONE", bold = true },
					TabLineSel = { fg = c.base.white, bg = "NONE", bold = true },
					LineNr = { fg = c.base.dimmed4, bg = "NONE" },
					TreesitterContext = { bg = "NONE" },
					TreesitterContextLineNumber = {
						fg = c.base.dimmed4,
						bg = "NONE",
					},
					TreesitterContextSeparator = { fg = c.base.dimmed4 },
					NvimTreeModifiedIcon = { fg = c.base.white },
					NvimTreeGitStagedIcon = { fg = c.base.green },
					NvimTreeGitDeletedIcon = { fg = c.base.red },
					NvimTreeGitDirtyIcon = { fg = c.base.yellow },
					NvimTreeNormal = { bg = "NONE" },
					NvimTreeNormalNC = { bg = "NONE" },
					NvimTreeEndOfBuffer = { bg = "NONE" },
					NvimTreeWinSeparator = { fg = c.base.dimmed4, bg = "NONE" },
					NvimTreeStatusLine = { bg = "NONE" },
					NvimTreeStatusLineNC = { bg = "NONE" },
				}
			end,
		})

		vim.cmd.colorscheme("monokai-pro")
	end,
}
