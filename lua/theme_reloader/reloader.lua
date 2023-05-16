local utils = require("theme_reloader.utils")
local theme_file = vim.fn.expand("~/.config/nvim/theme")

local M = {}

local function read_all(fileName)
	local content = "dark"
	local f = io.open(fileName, "rb")
	if f then
		content = f:read("*all")
		f:close()
	end
	return utils.trim(content)
end

local function get_theme()
	return read_all(theme_file)
end

local function get_current_colorscheme(config)
	local current_theme = get_theme()
	vim.o.background = current_theme
	local light = string.find(current_theme, "light")
	local colorscheme = light and config.light or config.dark
	return colorscheme
end

function M.set_current_colorscheme(config)
	local colorscheme = get_current_colorscheme(config)
	vim.cmd.colorscheme(colorscheme)
end

local function reload(config)
	M.set_current_colorscheme(config)
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
		watch_file(theme_file)
	end

	-- reload vim config when background changes
	watch_file(theme_file)
	reload(config)
end

return M
