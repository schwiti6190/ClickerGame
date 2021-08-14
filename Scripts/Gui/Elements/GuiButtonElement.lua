---@class GuiButtonElement : GuiTextElement
GuiButtonElement = Class(GuiTextElement)

function GuiButtonElement:init(renderer,x,y,label,postLabel)
	GuiTextElement.init(self,renderer,x,y,label,postLabel)
	self.text:addEventListener("tap", self )
end

function GuiButtonElement:isClickable()
	return self:isVisible() and not self:isDisabled() 
end

function GuiButtonElement:tap(x,y)
	if self:isClickable() then
		self:raiseCallback(self.onClickCall)
	end
end