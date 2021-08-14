
require("Scripts.Gui.Screens.Clicker.GuiClickerScreen")
require("Scripts.Gui.Screens.GuiUpgradeScreen")
require("Scripts.Gui.Screens.GuiCurrencyScreen")
require("Scripts.Gui.Screens.GuiSettingScreen")
require("Scripts.Gui.Screens.Stats.GuiStatsScreen")
require("Scripts.Gui.Screens.GuiShopScreen")

---@class GuiMenuScreen : GuiScreen
GuiMenuScreen = Class(GuiScreen)
GuiMenuScreen.filePath = "Gui/GuiMenuScreen.json"

GuiMenuScreen.screenData = {
	upgrade = GuiUpgradeScreen,
	clicker = GuiClickerScreen,
	currency = GuiCurrencyScreen,
	setting = GuiSettingScreen,
	stats = GuiStatsScreen,
	shop = GuiShopScreen
}

function GuiMenuScreen:onClickClicker()
	self:changeScreen("clicker")
end

function GuiMenuScreen:onClickUpgrade()
	self:changeScreen("upgrade")
end

function GuiMenuScreen:onClickCurrency()
	self:changeScreen("currency")
end

function GuiMenuScreen:onClickSetting()
	self:changeScreen("setting")
end

function GuiMenuScreen:onClickStats()
	self:changeScreen("stats")
end

function GuiMenuScreen:onClickShop()
	self:changeScreen("shop")
end

function GuiMenuScreen:onClickQuit()
	self:quit()
end