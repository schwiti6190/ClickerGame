
---@class Currency : HandlerElement
Currency = Class(HandlerElement)

function Currency:init(currencyHandler)
	self.currencyHandler = currencyHandler
	self.marketValue = self.startMarketValue
	self.unlocked = true
	self.timer = 0
	HandlerElement.init(self)
end

function Currency:getValue()
	return self.value
end

function Currency:setValue(value)
	self.value = value
end

function Currency:isVisible()
	return self.unlocked
end

function Currency:isDisabled()
	return false --return self.value <= 0
end

function Currency:addValue()
	self.currencyHandler:changeCookieValue(self:getPrice())
	self:increaseValue(1*self:getBuyAmount())
end

function Currency:delValue()
	self.currencyHandler:changeCookieValue(self:getBuyAmount()*self.marketValue)
	self:decreaseValue(1*self:getBuyAmount())
end

function Currency:getPrice()
	return self.marketValue*(1+self:getTax())*self:getBuyAmount()
end

function Currency:getBuyAmount()
	return self.currencyHandler:getBuyAmount()
end

function Currency:onClick()
	self.currencyHandler:onClickCurrency(self)
end

function Currency:getLabel()
	return self.label
end

function Currency:getMarketValue()
	return self.marketValue
end

function Currency:getNewMarketValue()
	return self.value + self.timer*(self.goalPrice - self.value)/self.timerDuration + math.random(-self.ratioMarketValue,self.ratioMarketValue)
end

function Currency:updateGoalPrice()
	self.goalPrice = math.random(self.minMarketValue,self.maxMarketValue)
end

function Currency:getMarketValueText()
	return GuiUtils.getFormattedMoneyText(self.marketValue)
end

function Currency:getPriceText()
	return GuiUtils.getFormattedMoneyText(self:getPrice())
end

function Currency:update()
	if self.timer % self.timerDuration == 0 then
		self:updateGoalPrice()
		self.timer = 0
	end
	self.marketValue = math.max(self:getNewMarketValue(),0)
	self.timer = self.timer + 1
end

function Currency:isDisabledAdd()
	return self.currencyHandler:getCookieValue() < self:getBuyAmount()*self.marketValue
end

function Currency:isDisabledDel()
	return self.value < self:getBuyAmount()
end

function Currency:getTax()
	return self.taxes
end

function Currency:getTaxText()
	return string.format("%.1f%%",self.taxes*100)
end