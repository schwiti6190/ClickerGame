---Machine production increased by 50/100%
---@class PutinEvent : Event
PutinEvent = Class(Event)
PutinEvent.text = "Putin reitet Knappers zum Sieg!"
PutinEvent.helpText = "Machine production increased by 50/100%"
function PutinEvent:handleEvent()
	self.modifier = math.random(3,4) * 0.5
	Event.handleEvent(self)
end
