---@class HandlerElement
HandlerElement = Class()

function HandlerElement:init()
	self.value = 0
	self.lastValue = 0
end

function HandlerElement:onChangeValue()
	if self.totalStat then 
		local delta = self:getChangedAmount()
		if delta > 0 then 
			g_StatsHandler:addValue(self.totalStat,delta)
		end
	end
	self.lastValue = self.value
end

function HandlerElement:getChangedAmount()
	local delta = self.value - self.lastValue
	return delta,delta>0
end

function HandlerElement:setValue(value,bySave)
	self.value = value
	if bySave then 
		self.lastValue = value
	else 
		self:onChangeValue()
	end
end

function HandlerElement:getValue()
	return self.value
end

function HandlerElement:update()

end

function HandlerElement:isDisabled()
	return false
end

function HandlerElement:isVisible()
	return true
end

function HandlerElement:getText()
	return GuiUtils.getFormattedMoneyText(self.value)
end

function HandlerElement:increaseValue(value)
	self.value = self.value + value
	self:onChangeValue()
end

function HandlerElement:decreaseValue(value)
	self.value = self.value - value
	self:onChangeValue()
end


function HandlerElement:incrementValue()
	self:increaseValue(1)
end

function HandlerElement:applyFactor(factor)
	self.value = self.value * factor
	self:onChangeValue()
end

function HandlerElement:onClick()
	--- override
end
