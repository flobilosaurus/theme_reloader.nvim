local themeFile = vim.fn.expand("~/.config/nvim/theme")

local M = {}

local function read_all(fileName)
	local content = ""
	local f = io.open(fileName, "rb")
	if f then
		content = f:read("*all")
		f:close()
	end
	return content
end

local function get_current_colorscheme(config)
	local currentTheme = read_all(themeFile)
	local light = string.find(currentTheme, "light")
	local colorscheme = light and config.light or config.dark
	return colorscheme
end

local function set_current_colorscheme(config)
	local colorscheme = get_current_colorscheme(config)
	vim.cmd.colorscheme(colorscheme)
end

local function reload(config)
	set_current_colorscheme(config)
end

function M.attach(config)
	local w = vim.loop.new_fs_event()

	local on_change

	local function watch_file(fname)
		if w ~= nil then
			w:start(fname, {}, vim.schedule_wrap(on_change))
		end
	end

	on_change = function()
		reload(config)
		-- Debounce: stop/start.
		if w ~= nil then
			w:stop()
		end
		watch_file(themeFile)
	end

	-- reload vim config when background changes
	watch_file(themeFile)
	reload(config)
end

return M
