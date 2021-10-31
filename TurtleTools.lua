local TurtleTools = {}

function TurtleTools.refuelAll(dofuel, message)
	if dofuel == nil then
		dofuel = 1
	end
	dofuel = tonumber(dofuel)
	if dofuel == 0 then
		dofuel = 1
	end
	if message and turtle.getFuelLevel()<dofuel then
		print(message)
	end
	while turtle.getFuelLevel()<dofuel do
		sleep(3)
		shell.run("refuel all")
	end
	return true
end

function TurtleTools.findEmptySlot()
	for n = 1, 16 do
		if turtle.getItemCount(n) == 0 then
			return n
		end
	end
	return 0
end
function TurtleTools.selectEmptySlot()
	local slot = TurtleTools.findEmptySlot()
	if slot>0 then
		turtle.select(slot)
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
function TurtleTools.getToolsNames()
	local slot = TurtleTools.selectEmptySlot()
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

--[[Checks whether the tools is used
Parameters
tool1, tool2:string exact name, example:
minecraft:diamond_pickaxe, 
computercraft:wireless_modem_normal
Returns
1. boolean Whether the right tool is worn
2. string | nil Details, example:
 "No empty slots" - Requires a free slot
 in the inventory for verification
 "Empty Hands" - You can use this hands
 "Empty Hand Right" - You can use this hand
 "Empty Hand Left" - You can use this hand
 "Not empty hands"
 --]]
function TurtleTools.equipCheck(tool1, tool2)
	local right, left, msg = TurtleTools.getToolsNames()
	if msg then
		return false, msg --"No empty slots"
	end
	if right==nil and left==nil then
		msg = "Empty Hands"
	elseif right and left then
		msg = "Not empty hands"
	elseif right then
		msg = "Empty Hand Left"
	elseif left then
		msg = "Empty Hand Right"
	end
		
	if tool1==nil and tool2==nil then
		if right==nil and left==nil then
			return true, msg
		else
			return false, msg
		end
	elseif tool1!=nil and tool2!=nil then
		if (right==tool1 and left==tool2) or 
		(right==tool2 and left==tool1) then
			return true, msg
		else
			return false, msg
		end
	else
		if (tool1!=nil and (tool1==right or tool1==left)) or 
		(tool2!=nil and (tool2==right or tool2==left)) then
			return true, msg
		end
	end
end
	
	
	
	
		
		
		
		
		
	
	
return TurtleTools