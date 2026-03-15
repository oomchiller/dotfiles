local base_path = "oomchiller.core"

local options = {
	settings = {
		"options",
		"filetypes",
		"ui",
		"keymaps",
	},
	global = {
		"tabline",
	},
}

for _, category in ipairs({ "settings", "global" }) do
	local modules = options[category]
	for _, module in ipairs(modules) do
		local module_full_name = base_path .. "." .. category .. "." .. module
		require(module_full_name)
	end
end
