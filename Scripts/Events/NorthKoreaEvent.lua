---10% additional master.
---@class NorthKoreaEvent : Event
NorthKoreaEvent = Class(Event)
NorthKoreaEvent.text = "Atombombe zerstört die Konkurenz!"
NorthKoreaEvent.helpText = "10% additional masters "
NorthKoreaEvent.modifier = 1.1

function NorthKoreaEvent:handleEvent()
	local masterValue = self.itemHandler:getElementValue(Items.master)
	local delta = math.ceil(masterValue*self.modifier)
	self.itemHandler:setElementValue(Items.master,delta)
	g_StatsHandler:addValue(Stats.northKoreaEvent,delta-masterValue)
	Event.handleEvent(self)
end