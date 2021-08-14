
---@class GuiSettingScreen : GuiScreen
GuiSettingScreen = Class(GuiScreen)
GuiSettingScreen.filePath = "Gui/GuiSettingScreen.json"

function GuiSettingScreen:onClickSave()
	self.renderer:getClicker():onSave()
end

function GuiSettingScreen:onClickReset()
	self.renderer:getClicker():onReset()
end