---Everything 25/50% cheaper.
---@class ChinaEvent : Event
ChinaEvent = Class(Event)
ChinaEvent.text = "Made in China!"
ChinaEvent.helpText = "Everything 25/50% cheaper"
function ChinaEvent:handleEvent()
	self.modifier = math.random(1,2) * 0.25
	Event.handleEvent(self)
end
