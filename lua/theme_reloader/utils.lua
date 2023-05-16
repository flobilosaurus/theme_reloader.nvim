local M = {}

local function deepcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == "table" then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[deepcopy(orig_key)] = deepcopy(orig_value)
		end
		setmetatable(copy, deepcopy(getmetatable(orig)))
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

M.merge = function(left, right)
	local result = deepcopy(left)
	if right ~= nil then
		for k, v in pairs(right) do
			result[k] = v
		end
	end
	return result
end

return M
