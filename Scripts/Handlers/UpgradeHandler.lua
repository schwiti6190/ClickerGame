require("Scripts.Upgrades.Upgrade")
require("Scripts.Upgrades.CookieUpgrade")
require("Scripts.Upgrades.BakerUpgrade")
require("Scripts.Upgrades.MasterUpgrade")
require("Scripts.Upgrades.MachineUpgrade")
require("Scripts.Upgrades.WorkerUpgrade")


---@class UpgradeHandler : Handler
UpgradeHandler = Class(Handler)

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
	cookie = CookieUpgrade,
	baker = BakerUpgrade,
	master = MasterUpgrade,
	machine = MachineUpgrade,
	worker = WorkerUpgrade,
}

---@param itemHandler ItemHandler
function UpgradeHandler:init(clicker,renderer,itemHandler)
	self.itemHandler = itemHandler
	local screen = renderer:getUpgradeScreen()
	self:addElements({screen},self,itemHandler)
	screen:setCallbackClassToElements({buyAmount = self})
	Handler.init(self,clicker,renderer)
end