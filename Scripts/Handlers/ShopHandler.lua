require("Scripts.Shop.ShopItem")
require("Scripts.Shop.TwixShopItem")

---@class ShopHandler : Handler 
ShopHandler = Class(Handler)

---@field ShopItems table
ShopItems = {
	twix = "twix"
}

ShopHandler.elementsData = {
	twix = TwixShopItem,
}


function ShopHandler:init(clicker,renderer)
	local screen = renderer:getShopScreen()
	self:addElements({screen},self)

	Handler.init(self,clicker,renderer)
	---@type ShopHandler
	g_ShopHandler = self
end


