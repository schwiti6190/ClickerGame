
---@class GuiScreen 
GuiScreen = Class()

---@param renderer Renderer
function GuiScreen:init(renderer,parent)
	self.renderer = renderer
	self.parent = parent
	self.elements = self:addGuiElements(self.filePath)
	self.currentScreen = self
	self:setupScreens()
end

function GuiScreen:setupScreens()
	self.screens = {}
	if self.screenData then 
		for name,class in pairs(self.screenData) do 
			self.screens[name] = class(self.renderer,self)
		end
	end
end

function GuiScreen:changeScreen(newScreen)
	self.currentScreen:reset()
	self.currentScreen = self.screens[newScreen]
end

function GuiScreen:onClickBackToParent()
	self.currentScreen:reset()
	self.currentScreen = self
end

---@param filePath string
function GuiScreen:addGuiElements(filePath)
	if filePath then 
		return GuiUtils.setButtonsFromTable(filePath,self.renderer,self)
	else 
		return {}
	end
end

function GuiScreen:isVisible()
	return true
end

function GuiScreen:isDisabled()

end

---@param data table
function GuiScreen:setCallbackClassToElements(data)
	for elementName,callbackClass in pairs(data) do 
		for _,element in pairs(self.elements) do 
			if element:getClassName() == elementName then 
				element:setCallbackClass(callbackClass)
			end
		end
	end
end

function GuiScreen:reset() 
	for _,element in pairs(self.elements) do 
		element:reset()
	end
end

function GuiScreen:getElements()
	return self.elements
end

function GuiScreen:onClickBack()
	self.parent:onClickBackToParent()
end

function GuiScreen:draw()
	if self.currentScreen ~= self then 
		self.currentScreen:draw()
	else 
		for _,element in pairs(self:getElements()) do 
			element:draw()
		end
	end
end

function GuiScreen:getElement(elementName)
	return self.elements[elementName]
end

function GuiScreen:getScreen(screenName)
	return self.screens[screenName]
end