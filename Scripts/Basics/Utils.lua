
---@field Utils table
Utils = {}

---@param b number Base price
---@param r number Price modifier
---@param n number Buy amount
---@param k number Currently owned amount
function Utils.getPrice(b,r,n,k)
	return b*(r^k*(r^n-1))/(r-1)
end
