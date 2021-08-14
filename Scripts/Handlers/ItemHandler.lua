require("Scripts.Items.Item")
require("Scripts.Items.Cookie")
require("Scripts.Items.Baker")
require("Scripts.Items.Master")
require("Scripts.Items.Machine")
require("Scripts.Items.Worker")
require("Scripts.Items.Engineer")

---@field Items table
Items = {
	cookie = "cookie",
	baker = "baker",
	master = "master",
	machine = "machine",
	worker = "worker",
	engineer = "engineer"
}


---@class ItemHandler : Handler
ItemHandler = Class(Handler)

ItemHandler.elementsData = {
	cookie = Cookie,
	baker = Baker,
	master = Master,
	machine = Machine,
	worker = Worker,
}


function ItemHandler:init(clicker,renderer)
	local screen = renderer:getClickerScreen():getScreen("cookie")
	self:addElements({screen},self)
	screen:setCallbackClassToElements({cps = self,buyAmount = self,clickAmount = self.elements.cookie})
	
	Handler.init(self,clicker,renderer)
end

function ItemHandler:getCps()
	return string.format("%s/s",GuiUtils.getFormattedMoneyText(self.elements.machine:getCps()))
end

---@param upgrade Upgrade
function ItemHandler:getUpgrade(upgrade)
	return self.clicker:getUpgradeHandler():getElement(upgrade)
end

function ItemHandler:getCookieModifier()
	return self:getUpgrade(Upgrades.cookie):getModifier()
end

function ItemHandler:getBackerModifier()
	return self:getUpgrade(Upgrades.baker):getModifier()
end

function ItemHandler:getMasterModifier()
	return self:getUpgrade(Upgrades.master):getModifier()
end

function ItemHandler:getMachineModifier()
	return self:getUpgrade(Upgrades.machine):getModifier()
end

function ItemHandler:getWorkerModifier()
	return self:getUpgrade(Upgrades.worker):getModifier()
end
