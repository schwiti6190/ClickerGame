
---@class Stat : HandlerElement
Stat = Class(HandlerElement)
function Stat:init(statsHandler)
	self.statsHandler = statsHandler
	HandlerElement.init(self)
end
