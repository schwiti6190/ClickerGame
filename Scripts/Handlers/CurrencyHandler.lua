require("Scripts.Currencies.Currency")
require("Scripts.Currencies.CookieCoin")

---@field Currencies table
Currencies = {
	cookieCoin = "cookieCoin",
}


---@class CurrencyHandler : Handler
CurrencyHandler = Class(Handler)

CurrencyHandler.elementsData = {
	cookieCoin = CookieCoin,
}


function CurrencyHandler:init(clicker,renderer,itemHandler)
	---@type ItemHandler
	self.itemHandler = itemHandler
	local screen = renderer:getCurrencyScreen()
	self:addElements({screen},self)
	screen:getWindow():setCallbackClassToElements({buyAmount = self,cookieDisplay = itemHandler:getElement(Items.cookie)})
	
	Handler.init(self,clicker,renderer)
end

function CurrencyHandler:onClickCurrency(currency)
	self.renderer:getCurrencyScreen():onClickCurrency(currency)
end

function CurrencyHandler:getCookieValue()
	return self.itemHandler:getElementValue(Items.cookie)
end

function CurrencyHandler:changeCookieValue(delta)
	self.itemHandler:increaseElementValue(Items.cookie,delta)
end