

---@class Machine : Item 
Machine = Class(Item)
Machine.totalStat = Stats.totalMachine
Machine.defaultPrice = 550
Machine.masterPrice = 10 
Machine.priceModifier = 1.25
Machine.timer = 3
Machine.cookieRewardModifier = 0.33 
Machine.defaultWorkerAmount = 3
Machine.workerAmountModifier = 1

function Machine:add()
	local masterValue = self.itemHandler:getElementValue(Items.master)
	if masterValue >= self.masterPrice then
		if Item.add(self) then 
			self.itemHandler:decreaseElementValue(Items.master,self.masterPrice)
			local workerValue = self.itemHandler:getElementValue(Items.worker)
			self.itemHandler:increaseElementValue(Items.worker,1)
			return true
		end
	end
end

function Machine:update()
	self:changeCookies()
	Item.update(self)
end

function Machine:changeCookies()
	local cookieReward,defaultCookieReward = self:getCookieReward()
	g_StatsHandler:addValue(Stats.putinEvent,cookieReward-defaultCookieReward) 
	self.itemHandler:increaseElementValue(Items.cookie,self:getCookieReward())
end

function Machine:getCookieReward()
	local workerValue = self.itemHandler:getElementValue(Items.worker)
	local value = self.cookieRewardModifier*workerValue*self.itemHandler:getMachineModifier()
	local adjustedValue = value*g_EventHandler:getModifier(Events.putin)
	return adjustedValue,value
end

function Machine:getWorkerFreeSpace()
	return self.defaultWorkerAmount*self.workerAmountModifier*self.value
end

function Machine:canInteract()
	local masterValue = self.itemHandler:getElementValue(Items.master)
	return masterValue >= self.masterPrice and Item.canInteract(self)
end

function Machine:getCps()
	return self:getCookieReward()
end