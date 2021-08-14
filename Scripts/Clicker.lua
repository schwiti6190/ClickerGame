require("Scripts.Basics.Class")
require("Scripts.Basics.Utils")

require("Scripts.Handlers.HandlerElement")

require("Scripts.Gui.Renderer")

require("Scripts.Handlers.Handler")
require("Scripts.Handlers.StatsHandler")
require("Scripts.Handlers.ItemHandler")
require("Scripts.Handlers.UpgradeHandler")
require("Scripts.Handlers.EventHandler")
require("Scripts.Handlers.CurrencyHandler")
require("Scripts.Handlers.ShopHandler")

local json = require( "json" )

---@class Clicker
Clicker = Class()
---@type boolean
Clicker.debug = true
--- every 2 mins
---@type number
Clicker.autoSaveInterval = 60*2*1000 

function Clicker:init()
	self:setup()
end

function Clicker:setup()
	---@type Renderer
	self.renderer = Renderer(self)
	---@type StatsHandler
	self.statsHandler = StatsHandler(self,self.renderer)
	---@type ShopHandler
	self.shopHandler = ShopHandler(self,self.renderer)
	---@type ItemHandler
	self.itemHandler = ItemHandler(self,self.renderer)
	---@type CurrencyHandler
	self.currencyHandler = CurrencyHandler(self,self.renderer,self.itemHandler)
	---@type UpgradeHandler
	self.upgradeHandler = UpgradeHandler(self,self.renderer,self.itemHandler)
	---@type EventHandler
	self.eventHandler = EventHandler(self,self.renderer,self.itemHandler)
	
	self:onLoad()
	timer.performWithDelay(self.autoSaveInterval,self,0)
end

function Clicker:onLoad()
	local filePath = system.pathForFile( "scores.json", system.DocumentsDirectory )

	local file = io.open( filePath, "r" )
 
    if file then
        local contents = file:read( "*a" )
        io.close( file )
        local data = json.decode( contents )
		if data then 
			print("Game loaded successfully")
			self.itemHandler:onLoad(data.items)
			self.upgradeHandler:onLoad(data.upgrades)
			self.currencyHandler:onLoad(data.currencies)
			self.statsHandler:onLoad(data.stats)
			self.shopHandler:onLoad(data.shop)
		end
    end
	file = nil
end

function Clicker:onSave(forceAmount)
	local path = system.pathForFile( "scores.json", system.DocumentsDirectory )

	local file, errorString = io.open( path, "w" )
	if not file then
		-- Error occurred; output the cause
		print( "File error: " .. errorString )
	else
		local saveData = {
			items = {},
			upgrades = {},
			currencies = {},
			stats = {},
			shop = {}
		}
		print("Game saved successfully")
		self.itemHandler:onSave(saveData.items,forceAmount and 0)
		self.upgradeHandler:onSave(saveData.upgrades,forceAmount and 1)
		self.currencyHandler:onSave(saveData.currencies,forceAmount and 0)
		self.statsHandler:onSave(saveData.stats,forceAmount and 0)
		self.shopHandler:onSave(saveData.shop,forceAmount and false)
		file:write( json.encode(saveData) )
		io.close( file )
	end
	file = nil
end

function Clicker:onReset()
	self:onSave(0)
	self:onLoad()
end

function Clicker:getRenderer()
	return self.renderer
end

function Clicker:getEventHandler()
	return self.eventHandler
end

function Clicker:getUpgradeHandler()
	return self.upgradeHandler
end

function Clicker:update()
	self.upgradeHandler:update()	
	self.itemHandler:update()
	self.currencyHandler:update()
	self.eventHandler:update()
end

function Clicker:draw() 
	self.renderer:draw()
end

--- Auto save timer
function Clicker:timer()
	print("Autosave")
	self:onSave()
end

function Clicker:stop()
	self:onSave()
	native.requestExit()
end

Clicker()