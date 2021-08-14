

---@class Worker : Item 
Worker = Class(Item)

Worker.defaultPrice = 730
Worker.priceModifier = 1.15
Worker.totalStat = Stats.totalWorker
function Worker:add()
	if self:hasFreeSpace() then 
		Item.add(self)
	end	 
end

function Worker:hasFreeSpace()
	local machineItem = self.itemHandler:getElement(Items.machine)
	local freeSpace = machineItem:getWorkerFreeSpace()*self.itemHandler:getWorkerModifier()
	return freeSpace > self.value
end

function Worker:canInteract()
	return self:hasFreeSpace() and Item.canInteract(self)
end