
require("Scripts.Gui.Screens.Clicker.GuiCookieClickerScreen")
require("Scripts.Gui.Screens.Clicker.GuiTwixClickerScreen")

---@class GuiClickerScreen : GuiScreen
GuiClickerScreen = Class(GuiScreen)
GuiClickerScreen.filePath ="Gui/Clicker/GuiClickerScreen.json"

GuiClickerScreen.screenData = {
	cookie = GuiCookieClickerScreen,
	twix = GuiTwixClickerScreen,
}

function GuiClickerScreen:onClickCookie()
	self:changeScreen("cookie")
end

function GuiClickerScreen:onClickTwix()
	self:changeScreen("twix")
end

function GuiClickerScreen:isVisibleTwix()
	return g_ShopHandler:getElementValue(ShopItems.twix)
end
