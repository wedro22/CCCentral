local TurtleTools = {}

local function TurtleTools.refuelAll(dofuel, message)
	if message and turtle.getFuelLevel<dofuel then
		print(message)
	end
	while turtle.getFuelLevel<dofuel do
		sleep(3)
		shell.run("refuel all")
	end
end

local function findEmptySlot()
	for n = 1, 16 do
		if turtle.getItemCount(n) == 0 then
			return n
		end
	end
	return 0
end
local function selectEmptySlot()
	local slot = findEmptySlot()
	if slot>0 then
		turtle.select(n)
	end
	return slot
end

--[[Checks whether the tool is used
Parameters
tool:string exact name, example:
minecraft:diamond_pickaxe
Returns
1. boolean Whether the right tool is worn
2. string | nil Details --]]
local function equipCheck(tool)
	local slot=selectEmptySlot()
	if slot == 0 then
		return false, "No empty slots"
	end
	
	
	
	