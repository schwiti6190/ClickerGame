---@class GuiElement
GuiElement = Class()

---@param renderer Renderer
---@param x number
---@param y number
function GuiElement:init(renderer,x,y)
	self.renderer = renderer
	self.x = x 
	self.y = y 
	self.disabledColor = {1,0,0}
	self.defaultColor = {0,0,0}
	self.activeColor = {0,1,1}
end

---@param callbacks table
---@param callbackClass Class
function GuiElement:setCallbacks(callbacks,callbackClass)
	self.callbackClass = callbackClass
	for callback,func  in pairs(callbacks) do 
		self[callback] = func
	end
end

---@param callbackClass Class
function GuiElement:setCallbackClass(class)
	self.callbackClass = class
end

function GuiElement:getClassName()
	return self.className
end

---@param name string
function GuiElement:setClassName(name)
	self.className = name
end

---@param callback function
---@param default value
function GuiElement:raiseCallback(callback,default)
	if callback and self.callbackClass[callback] then 
		return self.callbackClass[callback](self.callbackClass) 
	else
		return default
	end
end

function GuiElement:setDisabled(disabled)
	self.disabled = disabled
end

function GuiElement:isDisabled()
	return self.disabled or self:raiseCallback(self.disabledCall,false)
end

function GuiElement:setActive(active)
	self.active = active
end

function GuiElement:isActive()
	return self.active or self:raiseCallback(self.activeCall,false)
end

function GuiElement:setVisibility(visible)
	self.visible = visible
end

function GuiElement:isVisible()
	return self.visible or self:raiseCallback(self.visibleCall,true)
end

function GuiElement:getColor()
	
	
	return self:isDisabled() and self.disabledColor or self:isActive() and self.activeColor or self.defaultColor
end

function GuiElement:reset() 

end