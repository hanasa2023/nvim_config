local trans_toggle = function()
	local f = io.open('~/.config/nvim/lua/config/plugins/ui/colorscheme.lua', 'r')
	t = {}
	s = ''
	for l in f:lines() do
		for k, v in string.gmatch(l, '(%w+_?%w+) = (%w+),') do
			if (k == 'transparent_background') then
				if (v == 'true') then
					l = string.gsub(l, 'true', 'false', 1)
					print(l)
				else
					l = string.gsub(l, 'false', 'true')
				end
			end
		end
		s = s .. l .. '\n'
	end
	print(s)
	f:close()
	-- print(s)
	f = io.open('~/.config/nvim/lua/config/plugins/ui/colorscheme.lua', 'w+')
	f:write(s)
	f:flush()
	f:close()
end
