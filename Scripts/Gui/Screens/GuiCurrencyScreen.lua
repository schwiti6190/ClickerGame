require("Scripts.Gui.Screens.Windows.GuiCurrencyWindow")

---@class GuiCurrencyScreen : GuiScreen
GuiCurrencyScreen = Class(GuiScreen)
GuiCurrencyScreen.filePath = "Gui/GuiCurrencyScreen.json"

function GuiCurrencyScreen:init(...)
	GuiScreen.init(self,...)
	self.window = GuiCurrencyWindow(self.renderer,self)
	self.isWindowShown = false
end

function GuiCurrencyScreen:draw()
	if self.isWindowShown then 
		self.window:draw()
	else 
		GuiScreen.draw(self)
	end
end

function GuiCurrencyScreen:onClickCurrency(currency)
	self.isWindowShown = true
	self.window:setCallbackClassToElements({currency = currency})
	self:reset()
end

function GuiCurrencyScreen:onClickWindowBack()
	self.isWindowShown = false 
	self.window:reset()
end

function GuiCurrencyScreen:getWindow()
	return self.window
end