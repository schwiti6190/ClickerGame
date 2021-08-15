require("Scripts.Gui.GuiUtils")

require("Scripts.Gui.Elements.GuiElement")
require("Scripts.Gui.Elements.GuiTextElement")
require("Scripts.Gui.Elements.GuiButtonElement")

require("Scripts.Gui.Screens.GuiScreen")
require("Scripts.Gui.Screens.Windows.GuiWindow")
require("Scripts.Gui.Screens.GuiMenuScreen")



---@class Renderer
Renderer = Class()
Renderer.prefabsFilePath = "Gui/GuiPrefabs.json"

---@field GuiElements table
GuiElements = {
	["GuiElement"] = GuiElement,
	["GuiTextElement"] = GuiTextElement,
	["GuiButtonElement"] = GuiButtonElement,
}

---@param clicker Clicker
function Renderer:init(clicker)
	self.clicker = clicker
	self.prefabs = GuiUtils.getDataFromJsonFile(self.prefabsFilePath)
	self.background = display.newImageRect( "background.png", 360, 570 )
	self.background.x = display.contentCenterX
	self.background.y = display.contentCenterY
	self:setupScreen()
end

function Renderer:setupScreen()
	self.mainScreen = GuiMenuScreen(self)
end

function Renderer:getUpgradeScreen()
	return self.mainScreen:getScreen("upgrade")
end

function Renderer:getClickerScreen()
	return self.mainScreen:getScreen("clicker")
end

function Renderer:getCurrencyScreen()
	return self.mainScreen:getScreen("currency")
end

function Renderer:getStatsScreen()
	return self.mainScreen:getScreen("stats")
end

function Renderer:getShopScreen()
	return self.mainScreen:getScreen("shop")
end

function Renderer:getPrefabs()
	return self.prefabs
end

function Renderer:draw()
	self.mainScreen:draw()
end

function Renderer:quit()
	self.clicker:stop()
end

function Renderer:getClicker()
	return self.clicker
end