---@param cond boolean
---@param v1 any
---@param v2 any
---@return any
local function ternary(cond, v1, v2)
	if cond then
		return v1
	end

	return v2
end


return {
	ternary = ternary
}
