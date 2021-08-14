
---@class Event 
Event = Class()
Event.timerLength = 20
Event.text = "Text is missing!"

function Event:init(eventHandler,itemHandler)
	self.itemHandler = itemHandler
	self.eventHandler = eventHandler
end

function Event:isActive()
	return self.timer ~= nil
end

function Event:update()
	if self.timer and (self.timer + self.timerLength) < os.clock() then 
		print("Event finished")
		self.timer = nil
	end
end

function Event:handleEvent()
	self.timer = math.floor(os.clock())
end

function Event:getModifier()
	return self:isActive() and self.modifier or 1
end

function Event:isVisible()
	return self:isActive()
end

function Event:getText()
	return string.format("%s\n%s",self.text,self.helpText)
end