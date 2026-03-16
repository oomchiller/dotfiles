local K = {}

local function set(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts or {})
end

local function delete(mode, lhs, buffer)
	vim.keymap.del(mode, lhs, { buffer = buffer })
end

function K.set_keymaps(keymaps)
	for _, keymap in ipairs(keymaps) do
		local opts = {}

		if keymap.buffer ~= nil then
			opts.buffer = keymap.buffer
		end

		if keymap.desc ~= nil then
			opts.desc = keymap.desc
		end

		if keymap.silent ~= nil then
			opts.silent = keymap.silent
		end

		if keymap.expr ~= nil then
			opts.expr = keymap.expr
		end

		if keymap.nowait ~= nil then
			opts.nowait = keymap.nowait
		end

		if keymap.remap ~= nil then
			opts.remap = keymap.remap
		end

		set(keymap.mode, keymap.lhs, keymap.rhs, opts)
	end
end

function K.delete_keymaps(keymaps)
	for _, keymap in ipairs(keymaps) do
		delete(keymap.mode, keymap.lhs, keymap.buffer)
	end
end

return K
