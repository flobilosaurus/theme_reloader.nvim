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
end

return M
