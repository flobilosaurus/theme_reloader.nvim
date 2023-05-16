local reloader = require("theme_reloader.reloader")
local utils = require("theme_reloader.utils")

local M = {}

DEFAULT_CONFIG = {
	dark = "darkblue",
	light = "delek",
}

function M.setup(config)
	local final_config = utils.merge(DEFAULT_CONFIG, config)
	reloader.attach(final_config)
	-- workaround for bug in neovim related to light themes
	-- see: https://github.com/neovim/neovim/issues/22614
	vim.schedule(function()
		require("theme_reloader.reloader").set_current_colorscheme(final_config)
	end)
end

return M
