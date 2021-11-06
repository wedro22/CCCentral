--package.path="/downloads/CCCentral"
local turtletools=require "TurtleTools"
local chunk=require "Chunk"

local min_fuel = 200
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
	computercraft:monitor_advanced = 		{"Advanced Monitor", 	6},
	computercraft:computer_advanced = 		{"Advanced Computer", 	1},
	minecraft:chest = 						{"Chest", 				1},
	minecraft:stone_bricks = 				{"Stone Bricks", 		56},
	minecraft:sandstone = 					{"Sandstone", 			8},
	minecraft:sandstone_stairs = 			{"Sandstone Stairs", 	12},
	minecraft:sandstone_slab = 				{"Sandstone Slab", 		4}
}
turtletools.waitListItems(items_center0, 
"To build, put next items in the turtle inventory:")

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
--coordinates
print("Structures will be built in the middle of the chanks")
print("Step 1: Finding a location in the world")
print("Write the current coordinates of the turtle")
write("X:.. "); local x = read()
write("Y:.. "); local y = read()
write("Z:.. "); local z = read()
--facing
local mon = turtletools.findInInventory("computercraft:monitor_advanced")
turtle.select(mon)
turtletools.forward_place()
local mon_is, mon_detail = turtle.detect()
facing = mon_detail.state.facing
print(facing)

























