require("Scripts.Upgrades.Upgrade")

---@class UpgradeHandler : Handler
UpgradeHandler = Class(Handler)

UpgradeHandler.filePathData = "Scripts/Upgrades/Upgrades.json"

---@field Upgrades table
Upgrades = {
	cookie = "cookie",
	baker = "baker",
	master = "master",
	machine = "machine",
	worker = "worker"
}

---@field elementsData table
UpgradeHandler.elementsData = {
	cookie = Upgrade,
	baker = Upgrade,
	master = Upgrade,
	machine = Upgrade,
	worker = Upgrade,
}

---@param itemHandler ItemHandler
function UpgradeHandler:init(clicker,renderer,itemHandler)
	self.itemHandler = itemHandler
	local screen = renderer:getUpgradeScreen()
	self:addElements({screen},self,itemHandler)
	screen:setCallbackClassToElements({buyAmount = self})
	Handler.init(self,clicker,renderer)
	self:enrichElements()
end