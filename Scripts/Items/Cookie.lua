

---@class Cookie : Item 
Cookie = Class(Item)
Cookie.baseBakerModifier = 0.05
Cookie.baseMasterModifier = 0.1
Cookie.priceModifier = 0
Cookie.basePrice = 0
Cookie.totalStat = Stats.totalCookie

function Cookie:add()
	local clickAmount,defaultClickAmount = self:getClickAmount()
	self:increaseValue(clickAmount)
	g_StatsHandler:addValue(Stats.obamaEvent,clickAmount-defaultClickAmount)
	return true
end

function Cookie:getBackerModifier()
	local bakerValue = self.itemHandler:getElementValue(Items.baker)
	return 1 + bakerValue*self.baseBakerModifier*self.itemHandler:getBackerModifier()
end


function Cookie:getMasterModifier()
	local masterValue = self.itemHandler:getElementValue(Items.master)
	return 1 + masterValue*self.baseMasterModifier*self.itemHandler:getMasterModifier()
end

function Cookie:getClickAmount()
	local value = self:getMasterModifier()*self:getBackerModifier()*self.itemHandler:getCookieModifier()
	local adjustedValue = value*g_EventHandler:getModifier(Events.obama)
	return adjustedValue,value
end

function Cookie:getBuyAmount()
	return 1
end

function Cookie:isDisabled()
	return false
end

function Cookie:isVisible()
	return true
end