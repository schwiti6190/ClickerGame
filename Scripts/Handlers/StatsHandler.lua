require("Scripts.Stats.Stat")

---@class StatsHandler : Handler
StatsHandler = Class(Handler)

Stats = {
	--- Clicker
	totalCookie = "totalCookie",
	totalBaker = "totalBaker",
	totalMaster = "totalMaster",
	totalMachine = "totalMachine",
	totalWorker = "totalWorker",
	
	--- Currency 
	totalCookieCoin = "totalCookieCoin",

	--- Events 
	obamaEvent = "obamaEvent",
	putinEvent = "putinEvent",
	mexicoEvent = "mexicoEvent",
	greeceEvent = "greeceEvent",
	northKoreaEvent = "northKoreaEvent",
	chinaEvent = "chinaEvent",
	bavariaEvent = "bavariaEvent",
}

StatsHandler.elementsData = {
	--- Clicker
	totalCookie = Stat,
	totalBaker = Stat,
	totalMaster = Stat,
	totalMachine = Stat,
	totalWorker = Stat,

	--- Currency
	totalCookieCoin = Stat,

	--- Events 
	obamaEvent = Stat,
	putinEvent = Stat,
	mexicoEvent = Stat,
	greeceEvent = Stat,
	northKoreaEvent = Stat,
	chinaEvent = Stat,
	bavariaEvent = Stat,
}

function StatsHandler:init(clicker,renderer)
	Handler.init(self,clicker,renderer)
	local screenNames = {"clicker","currency","event"}
	local screens = {}
	for _,screenName in pairs(screenNames) do 
		local screen = renderer:getStatsScreen():getScreen(screenName)
		table.insert(screens,screen)
	end
	self:addElements(screens,self)
	g_StatsHandler = self
end

function StatsHandler:addValue(stat,value)
	if value ~= 0 then
		self.elements[stat]:increaseValue(value)
	end
end
