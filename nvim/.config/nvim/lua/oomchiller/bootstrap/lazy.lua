local M = {}

function M.setup()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

	if not vim.uv.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		})

		if vim.v.shell_error ~= 0 or not vim.uv.fs_stat(lazypath) then
			error(
				"lazy.nvim bootstrap failed. Install it manually with:\n"
					.. "git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "
					.. lazypath
			)
		end
	end

	vim.opt.rtp:prepend(lazypath)
end

return M
