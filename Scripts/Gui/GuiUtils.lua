
---@field GuiUtils table
GuiUtils = {}
local json = require( "json" )
function GuiUtils.setButtonsFromTable(filePath,renderer,callbackClass)
	local elements = {}
	local prefabs = renderer:getPrefabs()
	local data = GuiUtils.getDataFromJsonFile(filePath)
	for elementName,Data in pairs(data) do
		local prefab = Data.prefab and prefabs[Data.prefab]
		if prefab then 
			GuiUtils.enrichGuiElementWithPrefab(Data,prefab,prefabs)
		end
		for _,elementData in pairs(Data) do
			if type(elementData) == "table" then 
				local className = elementData.class
				local class = className and GuiElements[className]
				local element = class(renderer,elementData.x,elementData.y,elementData.label,elementData.postLabel)
				element:setCallbacks(elementData.callbacks,callbackClass)
				table.insert(elements,element)
				element:setClassName(elementName) 
			end
		end
	end
	return elements
end

function GuiUtils.enrichGuiElementWithPrefab(element,prefab,prefabs)
	if type(element) == "table" then 
		local Prefab = prefab["prefab"] and prefabs[prefab["prefab"]]
		if Prefab then 
			GuiUtils.enrichGuiElementWithPrefab(prefab,Prefab,prefabs)
		end
		for i,subPrefab in pairs(prefab) do 	
		
			if element[i] == nil then element[i] = subPrefab end
			GuiUtils.enrichGuiElementWithPrefab(element[i],subPrefab,prefabs)
		end
	end
end

GuiUtils.moneyEndings = {
	"k",
	"M",
	"B",
	"T",
	"aa",

	"ab",
	"ac",
	"ad",
	"ae",
	"af",

	"ba",
	"bb",
	"bc",
	"bd",
	"be",

	"bf",
	"ca",
	"cb",
	"cc",
	"cd"
}
GuiUtils.numMoneyEndings = 20


function GuiUtils.getFormattedMoneyText(value)
	for i=GuiUtils.numMoneyEndings,1,-1 do 
		if i == 0 then 
			return value
		end
		local x = value/(10^(i*3))
		if x>=1 then 
			return string.format("%.1f %s", x,GuiUtils.moneyEndings[i])
		end
	end
	return string.format("%.1f",value)
end

function GuiUtils.getDataFromJsonFile(filePath)
	print(system.pathForFile())
	filePath =  system.pathForFile(filePath)
	local data 
	print(filePath)
	local file =  io.open(filePath,"r")
	if file then 
		local jsonData = file:read("*a")
		
		if jsonData then 
			data = json.decode(jsonData)
		else 
			print("data error")
		end
	else 
		print("file error")
	end
	io.close( file )
	file = nil
	return data
end

function GuiUtils.setDataToJson(filePath,data)
	local file = io.open(filePath,"w")
	if file then 
		local jsonData = json.encode(data)
		if jsonData then 
			file.write(jsonData)
		else 
			print("json error")
		end
		io.close( file )
	else 
		print("file error")
	end
	file = nil
end

function GuiUtils.printTable(data,inputIndent,depth,maxDepth)
	inputIndent = inputIndent or "  "
    depth = depth or 0
    maxDepth = maxDepth or 3
    if depth > maxDepth then
        return
    end
    local debugString = ""
    for i,j in pairs(data) do
        print(inputIndent..tostring(i).." :: "..tostring(j))
        if type(j) == "table" then
            GuiUtils.printTable(j, inputIndent.."    ", depth+1, maxDepth)
        end
    end
    return debugString
end

function GuiUtils.printTableValue(index,value)
	print(string.format("name: %s, element: %s",index,value))
end