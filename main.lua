-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
require("Scripts.Clicker")

local game = Clicker()

local function gameLoop()
	game:update()
 
end
gameLoopTimer = timer.performWithDelay( 1000, gameLoop, 0 )

local function graphicLoop()
	game:draw()
end
graphicLoopTimer = timer.performWithDelay(100,graphicLoop,0)
