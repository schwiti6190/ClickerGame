
---@class Handler 
Handler = Class()
---@field elementsData table
Handler.elementsData = {}
---@field buyAmounts table
Handler.buyAmounts = {
	1,
	5,
	10,
	50,
	100,
	200,
	500,
	1000,
	10000,
	100000,
	1000000
}

---@param clicker Clicker
---@param renderer Renderer
function Handler:init(clicker,renderer)
	self.clicker = clicker
	---@type Renderer
	self.renderer = renderer
	self.buyAmountIx = 1
end

function Handler:update()
	for _,i in pairs(self.elements) do 
		i:update()
	end
end

---@param screen table
function Handler:addElements(screens,...)
	---@field elements table
	self.elements = {}
	for elementName,class in pairs(self.elementsData) do 
		local element = class(...)
		self.elements[elementName] = element
	end
	for _,screen in pairs(screens) do 
		screen:setCallbackClassToElements(self.elements)
	end
end

function Handler:getElements()
	return self.elements
end

---@param event table
function Handler:getEvent(event)
	return self.clicker:getEventHandler():getEvent(event)
end

function Handler:getBuyAmount()
	return self.buyAmounts[self.buyAmountIx]
end

function Handler:getBuyAmountText()
	return GuiUtils.getFormattedMoneyText(self:getBuyAmount())
end

function Handler:changeBuyAmount()
	local ix = self.buyAmountIx + 1
	if ix > #self.buyAmounts then 
		ix = 1
	end
	self.buyAmountIx = ix
end

---@param data table
function Handler:onLoad(data)
	if data then 
		for elementName,value in pairs(data) do 
			local element = self.elements[elementName]
			if element then 
				element:setValue(value,true)
			end
		end
	end	
end

---@param data table
---@param forceAmount number
function Handler:onSave(elementSaveValues,forceAmount)
	for elementName,element in pairs(self.elements) do 
		elementSaveValues[elementName] = forceAmount or element:getValue()
	end
end


function Handler:getElement(element)
	return self.elements[element]
end

function Handler:getElementValue(element)
	return self.elements[element]:getValue()
end

---@param value number
function Handler:setElementValue(element,value)
	self.elements[element]:setValue(value)
end

---@param value number
function Handler:increaseElementValue(element,value)
	self.elements[element]:increaseValue(value)
end

---@param value number
function Handler:decreaseElementValue(element,value)
	self.elements[element]:decreaseValue(value)
end

---@param factor number
function Handler:applyElementFactor(element,factor)
	self.elements[element]:applyFactor(factor)
end

function Handler:getData()
	if self.filePathData then
		return GuiUtils.getDataFromJsonFile(self.filePathData)
	end
end

function Handler:enrichElements()
	local elementsData = self:getData()
	if elementsData then 
		for elementName,element in pairs(self.elements) do 
			if elementsData[elementName] then 
				for name,data in pairs(elementsData[elementName]) do 
					element[name] = data
				end
			end
		end
	end
end