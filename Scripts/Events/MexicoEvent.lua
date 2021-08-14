---10% loss of master from 10 master onwards.
---@class MexicoEvent : Event
MexicoEvent = Class(Event)
MexicoEvent.text = "Die klauen unsere Jobs."
MexicoEvent.helpText = "10% loss of master from 10 master onwards"
MexicoEvent.threshold = 10
MexicoEvent.modifier = 0.9

function MexicoEvent:handleEvent()
	local masterValue = self.itemHandler:getElementValue(Items.master)
	if masterValue >= self.threshold then 
		local delta = math.ceil(masterValue*self.modifier)
		self.itemHandler:setElementValue(Items.master,delta)
		g_StatsHandler:addValue(Stats.mexicoEvent,masterValue-delta)
	end
	Event.handleEvent(self)
end