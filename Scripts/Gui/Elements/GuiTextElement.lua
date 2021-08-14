---@class GuiTextElement : GuiElement
GuiTextElement = Class(GuiElement)

---@param label string
function GuiTextElement:init(renderer,x,y,label,postLabel)
	self.text = display.newText("",x,y,native.systemFont,20); 
	self.text.anchorX = 0
	self.label = label or ""
	self.postLabel = postLabel or ""
	GuiElement.init(self,renderer,x,y)
end

function GuiTextElement:setLabel(label)
	self.label = label 
end

function GuiTextElement:getLabel()
	return self:raiseCallback(self.labelCall) or self.label
end

function GuiTextElement:getPostLabel()
	return self:raiseCallback(self.postLabelCall) or self.postLabel
end

function GuiTextElement:getText()
	return string.format("%s%s%s",self:getLabel(), self:raiseCallback(self.textCall,""),self:getPostLabel())
end

function GuiTextElement:getWidth()
	return string.len(self:getText())
end

function GuiTextElement:draw()
	if self:isVisible() then
		self.text.text = self:getText()
		self.text:setFillColor( unpack(self:getColor()) )
	else 
		self.text.text = ""
	end
end

function GuiTextElement:reset() 
	self.text.text = ""
end