
---Cookie modifier 100/200 % additional.
---@class ObamaEvent : Event
ObamaEvent = Class(Event)
ObamaEvent.text = "Yes we can!"
ObamaEvent.helpText = "Cookie modifier 100/200 % additional."

function ObamaEvent:handleEvent()
	self.modifier = math.random(2,3)
	Event.handleEvent(self)
end
