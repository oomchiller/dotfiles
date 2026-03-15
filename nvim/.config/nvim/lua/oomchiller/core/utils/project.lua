local P = {}

local function current_bufname()
	local bufname = vim.api.nvim_buf_get_name(0)
	if bufname == "" then
		return nil
	end

	return vim.fs.normalize(bufname)
end

function P.find_root(markers, bufname)
	local path = bufname or current_bufname()
	local start_path = path and vim.fs.dirname(path) or vim.uv.cwd()
	local match = vim.fs.find(markers, {
		path = start_path,
		upward = true,
	})[1]

	if not match then
		return nil
	end

	return vim.fs.dirname(match)
end

function P.bundle_wrap(command, args, bufname)
	local root = P.find_root({ "Gemfile", "gems.rb" }, bufname)
	local bundle = vim.fn.exepath("bundle")

	if root and bundle ~= "" then
		local wrapped_args = { "exec", command }
		vim.list_extend(wrapped_args, args)
		return bundle, wrapped_args, root
	end

	return command, args, root
end

return P
