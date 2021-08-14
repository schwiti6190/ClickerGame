
---@class ShopItem : HandlerElement
ShopItem = Class(HandlerElement)

function ShopItem:init(shopHandler)
	self.shopHandler = shopHandler
	HandlerElement.init(self)
	self.value = false
end

function ShopItem:isDisabled()
	return false--not self.value
end

function ShopItem:isActive()
	return self.value
end

function ShopItem:isVisible()
	return true
end

function ShopItem:isPriceVisible()
	return not self.value
end

function ShopItem:getPriceText()
	return GuiUtils.getFormattedMoneyText(self.price)
end

function ShopItem:getText()
	return ""
end

function ShopItem:onClick()
	if not self.value then self.value = true end
end