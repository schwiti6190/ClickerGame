---Upgrades 5/10 % cheaper.
---@class BavariaEvent : Event
BavariaEvent = Class(Event)
BavariaEvent.text = "Bayrische Knopperswurst!"
BavariaEvent.helpText = "Upgrades 5/10 % cheaper"

function BavariaEvent:handleEvent()
	self.modifier = 1-math.random(1,2)*0.05
	Event.handleEvent(self)
end
