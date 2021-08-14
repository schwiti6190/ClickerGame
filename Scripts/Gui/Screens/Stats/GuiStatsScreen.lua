require("Scripts.Gui.Screens.Stats.GuiClickerStatsScreen")
require("Scripts.Gui.Screens.Stats.GuiCurrencyStatsScreen")
require("Scripts.Gui.Screens.Stats.GuiEventStatsScreen")
---@class GuiStatsScreen : GuiScreen
GuiStatsScreen = Class(GuiScreen)
GuiStatsScreen.filePath = "Gui/Stats/GuiStatsScreen.json"

GuiStatsScreen.screenData = {
	clicker = GuiClickerStatsScreen,
	currency = GuiCurrencyStatsScreen,
	event = GuiEventStatsScreen
}

function GuiStatsScreen:onClickClicker()
	self:changeScreen("clicker")
end

function GuiStatsScreen:onClickCurrency()
	self:changeScreen("currency")
end

function GuiStatsScreen:onClickEvent()
	self:changeScreen("event")
end