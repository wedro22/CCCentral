--package.path="/downloads/CCCentral"
local turtletools=require "TurtleTools"
local chunk=require "Chunk"

local min_fuel = 100
local side = {SOUTH, WEST, NORTH, EAST}
local facing = nil

--Step 0----------------
term.clear()
term.setCursorPos(1, 1)
print("Step 0: Preparing the turtle for work")
--fuel
if turtle.getFuelLevel() < min_fuel then
	print(turtletools.str_needfuel)
	turtletools.dofuelAll(min_fuel)
end
--inventory
local items_center0 = {

}

--inventory_free
if turtletools.findEmptySlot() == 0 then
	print(turtletools.str_fullinventory)
end
while turtletools.findEmptySlot() == 0 do
	sleep(3)
end
--pickaxe
local h, b = turtletools.getToolNameRight(turtletools.str_pickaxe)
if b == false then
	h, b = turtletools.getToolNameLeft(turtletools.str_pickaxe)
	if b == false then
		print(turtletools.str_needpickaxe)
	else
		turtletools.selectEmptySlot()
		turtle.equipLeft()
		turtle.equipRight()
	end
end
if b == false then
	turtletools.equipTool(turtletools.str_pickaxe)
end

--Step 1----------------
term.clear()
term.setCursorPos(1, 1)
print("Structures will be built in the middle of the chanks")
print("Step 1: Finding a location in the world")
print("Write the current coordinates of the turtle")
write("X:.. "); local x = read()
write("Y:.. "); local y = read()
write("Z:.. "); local z = read()
--выставить монитор для проверки фейса


























