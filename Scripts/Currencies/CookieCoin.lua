
---@class CookieCoin : Currency
CookieCoin = Class(Currency)
CookieCoin.label = "Knop coin: "
CookieCoin.maxMarketValue = math.random(1000,20000)
CookieCoin.minMarketValue = 0.25
CookieCoin.ratioMarketValue = 20
CookieCoin.startMarketValue = math.random(100,1000)
CookieCoin.taxes = 0.1
CookieCoin.timerDuration = 120
CookieCoin.totalStat = Stats.totalCookieCoin