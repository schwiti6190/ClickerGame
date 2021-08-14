require("Scripts.Events.Event")
require("Scripts.Events.BavariaEvent")
require("Scripts.Events.ChinaEvent")
require("Scripts.Events.GreeceEvent")
require("Scripts.Events.MexicoEvent")
require("Scripts.Events.NorthKoreaEvent")
require("Scripts.Events.ObamaEvent")
require("Scripts.Events.PutinEvent")
timer = require("timer")

---@class EventHandler
EventHandler = Class()
EventHandler.timerDelay = 120*1000

---@field Events table
Events = {
	obama = "obama",
	putin = "putin",
	greece = "greece",
	china = "china",
	northKorea = "northKorea",
	mexico = "mexico",
	bavaria = "bavaria",
}

---@param clicker Clicker
---@param renderer Renderer
---@param itemHandler ItemHandler
function EventHandler:init(clicker,renderer,itemHandler)
	self.itemHandler = itemHandler
	self.renderer = renderer
	self.clicker = clicker
	self.events = {
		obama = ObamaEvent(self,self.itemHandler),
		putin = PutinEvent(self,self.itemHandler),
		greece = GreeceEvent(self,self.itemHandler),
		china = ChinaEvent(self,self.itemHandler),
		northKorea = NorthKoreaEvent(self,self.itemHandler),
		mexico = MexicoEvent(self,self.itemHandler),
		bavaria = BavariaEvent(self,self.itemHandler),
	}
	self.currentEvent = self.events.obama
	self.numEvents = 7

	local screen = renderer:getClickerScreen()
	screen:setCallbackClassToElements({event = self.events.obama})
	timer.performWithDelay(self.timerDelay,self,0);
	g_EventHandler = self
end

function EventHandler:update()
	
	for _,event in pairs(self.events) do 
		event:update()
	end
end

function EventHandler:timer()
	local eventIx = math.random(1,self.numEvents)
	local i = 1
	for _,event in pairs(self.events) do 
		if i == eventIx then 
			local screen = self.renderer:getClickerScreen()
			screen:setCallbackClassToElements({event = event})
			event:handleEvent()
			print(string.format("Event: %s, eventIx: %d",event:getText(),i))

			break
		end
		i = i + 1
	end

end

function EventHandler:getEvent(event)
	return self.events[event]
end

function EventHandler:getModifier(event)
	return self.events[event]:getModifier()
end