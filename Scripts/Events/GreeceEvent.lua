---Instant loss of 5%/7,5%/10% Cookies.
---@class GreeceEvent : Event
GreeceEvent = Class(Event)
GreeceEvent.text = "Du Pleitegeier!"
GreeceEvent.helpText = "Instant loss of 5%/7,5%/10% Cookies."
function GreeceEvent:handleEvent()
	local modifier = 1-math.random(2,4) * 0.025
	self.itemHandler:applyElementFactor(Items.cookie,modifier)
	local cookieValue = self.itemHandler:getElementValue(Items.cookie)
	g_StatsHandler:addValue(Stats.greeceEvent,cookieValue*-(modifier-1))
	Event.handleEvent(self)
end

