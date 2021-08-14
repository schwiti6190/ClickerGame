
---@class GuiWindow 
GuiWindow = Class(GuiScreen)

---@param renderer Renderer
function GuiWindow:init(renderer,screen)
	self.screen = screen
	GuiScreen.init(self,renderer,screen)
end

function GuiWindow:onClickBack()
	self.screen:onClickWindowBack()
end