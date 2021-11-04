local TurtleTools = {}

function TurtleTools.dofuelAll(dofuel, message)
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

--[[Returns the name of the tool used
 or Check the use of the tool by name.
Parameter tool:string exact name,
 example: minecraft:diamond_pickaxe
 or nil to return the name of the tool used
Requires a empty slot in the inventory
 for verification. If not, returns 
 nil, "No empty slot"
Returns
 1. string 
  "No empty slot" (Only if there is no empty space in the inventory)
  | (getting the name of the tool. If the tool name = nil, then returns "")
 2. boolean (checking the equality of the tool name and the tool argument) --]]
function TurtleTools.getToolNameRight(tool)
	local slot = TurtleTools.selectEmptySlot()
	local hand = ""
	local equality = false
	if slot == 0 then
		return "No empty slot", equality
	end
	turtle.equipRight()
	if turtle.getItemCount(slot)>0 then
		hand = turtle.getItemDetail().name
		turtle.equipRight()
	end
	if tool~=nil then
		if tool==hand then
			equality = true
		end
	end
	return hand, equality
end
function TurtleTools.getToolNameLeft(tool)
	local slot = TurtleTools.selectEmptySlot()
	local hand = ""
	local equality = false
	if slot == 0 then
		return "No empty slot", equality
	end
	turtle.equipLeft()
	if turtle.getItemCount(slot)>0 then
		hand = turtle.getItemDetail().name
		turtle.equipLeft()
	end
	if tool~=nil then
		if tool==hand then
			equality = true
		end
	end
	return hand, equality
end









	
	
	
		
		
		
		
		
	
	
return TurtleTools