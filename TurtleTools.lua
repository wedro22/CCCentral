local TurtleTools = {}

function TurtleTools.refuelAll(dofuel, message)
	if dofuel == nil then
		dofuel = 1
	dofuel = tonumber(dofuel)
	if dofuel == 0 then
		dofuel = 1
	end
	if message and turtle.getFuelLevel<dofuel then
		print(message)
	end
	while turtle.getFuelLevel<dofuel do
		sleep(3)
		shell.run("refuel all")
	end
	return true
end

function findEmptySlot()
	for n = 1, 16 do
		if turtle.getItemCount(n) == 0 then
			return n
		end
	end
	return 0
end
function selectEmptySlot()
	local slot = findEmptySlot()
	if slot>0 then
		turtle.select(n)
	end
	return slot
end

--[[Returns the names of the tools used.
Returns the right one first,
 then the left one. example:
 minecraft:diamond_pickaxe--
Requires a free slot in the inventory
 for verification. If not, returns 
 nil, nil, "No empty slots"]]
function getToolsNames()
	local slot = selectEmptySlot()
	local rightHand
	local leftHand
	if slot == 0 then
		return nil, nil, "No empty slots"
	end
	turtle.equipRight()
	if turtle.getItemCount(slot)>0 then
		rightHand = turtle.getItemDetail().name
	end
	turtle.equipRight()
	turtle.equipLeft()
	if turtle.getItemCount(slot)>0 then
		leftHand = turtle.getItemDetail().name
	end
	turtle.equipLeft()
	return rightHand, leftHand
end

--[[Checks whether the tool is used
Parameters
tool:string exact name, example:
minecraft:diamond_pickaxe
Returns
1. boolean Whether the right tool is worn
2. string | nil Details, example:
 "No empty slots" - Requires a free slot
 in the inventory for verification
 "Empty Hands" - You can use this hands
 "Empty Hand" - You can use this hand
 "Not empty hands"
 --]]
function equipCheck(tool)
	local right, left, msg = getToolsNames()
	if msg then
		return false, msg --"No empty slots"
	elseif right==nil and left==nil then
		return false, "Empty Hands"
	elseif right==nil or left==nil then
		return false, "Empty Hand"
	elseif right == tool or left == tool then
		return true
	end
	return false, "Not empty hands"
end
	
	
	
	
		
		
		
		
		
	
	
return TurtleTools