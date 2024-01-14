--Hanasa's default nvim keymap settings
vim.g.mapleader = ' '

local mode_n = { 'n' }
local mode_i = { 'i' }

local keyMappings = {
	{ from = 'J',  to = '5j',    mode = mode_n },
	{ from = 'K',  to = '5k',    mode = mode_n },
	{ from = 'jj', to = '<ESC>', mode = mode_i },
	{ from = 'S',  to = ':w<CR>' },
	{ from = 'Q',  to = ':q<CR>' }
}

for _, mapping in ipairs(keyMappings) do
	vim.keymap.set(mapping.mode or 'n', mapping.from, mapping.to)
end

-- no meaning
