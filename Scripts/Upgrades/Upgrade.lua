
---@class Upgrade : HandlerElement
Upgrade = Class(HandlerElement)
Upgrade.basePrice = 0
Upgrade.priceModifier = 1

function Upgrade:init(upgradeHandler,itemHandler)
	self.itemHandler = itemHandler
	self.upgradeHandler = upgradeHandler
	HandlerElement.init(self)
	self.value = 1
end

function Upgrade:getData(filePath)
	local data = GuiUtils.getDataFromJsonFile(filePath)
end

function Upgrade:getText()
	return string.format("x%s",GuiUtils.getFormattedMoneyText(self:getModifier()))
end

function Upgrade:getModifier()
	return self.value
end

function Upgrade:getPrice()
	local price = Utils.getPrice(self.basePrice,self.priceModifier,self:getBuyAmount(),self.value)
	local adjustedPrice = price * g_EventHandler:getModifier(Events.bavaria)
	return adjustedPrice,price
end

function Upgrade:getPriceText()
	return GuiUtils.getFormattedMoneyText(self:getPrice())
end

function Upgrade:onClick()
	local cookieValue = self.itemHandler:getElementValue(Items.cookie)
	local price,defaultPrice = self:getPrice()
	if cookieValue >= price then 
		self:add()
		g_StatsHandler:addValue(Stats.bavariaEvent,price-defaultPrice)
	end
end

function Upgrade:add()
	self.itemHandler:decreaseElementValue(Items.cookie,self:getPrice())
	self.value = self.value + self:getBuyAmount()
end

function Upgrade:isDisabled()
	local cookieValue = self.itemHandler:getElementValue(Items.cookie)
	return cookieValue < self:getPrice()
end

function Upgrade:isVisible()
	return true
	--	return not (self:isDisabled() and self.value == 1)
end

function Upgrade:getBuyAmount()
	return self.upgradeHandler:getBuyAmount()
end
