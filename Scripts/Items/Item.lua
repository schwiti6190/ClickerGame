

---@class Item : HandlerElement
Item = Class(HandlerElement)

function Item:init(itemHandler)
	self.itemHandler = itemHandler
	HandlerElement.init(self)
end

function Item:isDisabled()
	return not self:canInteract()
end

function Item:isVisible()
	return self:canInteract() or self.value > 0
end

function Item:canInteract()
	local cookieValue = self.itemHandler:getElementValue(Items.cookie)
	return cookieValue>=self:getPrice()
end

function Item:onClick()
	self:add()
end

function Item:add()
	local cookieValue = self.itemHandler:getElementValue(Items.cookie)
	local price,defaultPrice = self:getPrice()
	if cookieValue>=price then 
		self:increaseValue(self:getClickAmount()*self:getBuyAmount())
		self.itemHandler:decreaseElementValue(Items.cookie,price)
		g_StatsHandler:addValue(Stats.chinaEvent,price-defaultPrice)
		return true
	end
end

function Item:getPrice()
	local price = Utils.getPrice(self.defaultPrice,self.priceModifier,self:getBuyAmount(),self.value)
	local adjustedPrice = price*g_EventHandler:getModifier(Events.china)
	return adjustedPrice,price
end

function Item:getPriceText()
	return GuiUtils.getFormattedMoneyText(self:getPrice())
end		

function Item:getClickAmount()
	return 1
end

function Item:getClickAmountText()
	return GuiUtils.getFormattedMoneyText(self:getClickAmount())
end

function Item:getBuyAmount()
	return self.itemHandler:getBuyAmount()
end