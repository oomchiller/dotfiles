local function load_plugins()
	local plugins = {}
	local plugin_dir = vim.fn.stdpath("config") .. "/lua/oomchiller/plugins"
	local plugin_files = {}

	for file in vim.fs.dir(plugin_dir) do
		if file:match("^nvim-.*%.lua$") then
			table.insert(plugin_files, file)
		end
	end

	table.sort(plugin_files)

	for _, file in ipairs(plugin_files) do
		local module_name = "oomchiller.plugins." .. file:gsub("%.lua$", "")
		table.insert(plugins, require(module_name))
	end

	return plugins
end

return load_plugins()
