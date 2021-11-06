--package.path="/downloads/CCCentral"
local turtletools=require "TurtleTools"
local chunk=require "Chunk"
local firmware=require "Firmware"

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

--disarm
turtletools.disarm()

--inventory
local items_center0 = {
	["computercraft:monitor_advanced"] = 		{"Advanced Monitor", 	6},
	["computercraft:computer_advanced"] = 		{"Advanced Computer", 	1},
	--["computercraft:computer_normal"] = 		{"Computer", 			4},
	--["computercraft:wireless_modem_normal"] = 	{"Wireless Modem", 		5},
	["minecraft:chest"] = 						{"Chest", 				1},
	["minecraft:stone_bricks"] = 				{"Stone Bricks", 		56},
	["minecraft:sandstone"] = 					{"Sandstone", 			8},
	["minecraft:sandstone_stairs"] = 			{"Sandstone Stairs", 	12},
	["minecraft:sandstone_slab"] = 				{"Sandstone Slab", 		4},
	["minecraft:diamond_pickaxe"] = 			{"Diamond Pickaxe", 	1}
}
turtletools.waitListItems(items_center0, 
"To build, put next items in the turtle inventory:")

--pickaxe
turtle.select(turtletools.getItem("minecraft:diamond_pickaxe"))
if not turtle.equipRight() then
	print("Replace the pickaxe with an unused one")
	while not turtle.equipRight() do
		sleep(3)
		turtle.select(turtletools.getItem("minecraft:diamond_pickaxe"))
	end
end
--modem
--[[turtle.select(
turtletools.getItem("computercraft:wireless_modem_normal"))
turtle.equipLeft()--]]

--Step 1----------------
term.clear()
term.setCursorPos(1, 1)
--coordinates
print("Structure will be built in the middle of this Chunk")
print("Step 1: Finding a location in the world")
print("Write the current coordinates of the turtle")
write("X:.. "); local x = read()
write("Y:.. "); local y = read()
write("Z:.. "); local z = read()
--facing
turtle.select(turtletools.getItem("computercraft:monitor_advanced"))
turtletools.forward_place()
local mon_is, mon_detail = turtle.inspect()
facing = mon_detail.state.facing
turtle.dig()
print(facing)

--Step 2----------------
print("Step 2")
print("Go to the beginning of construction")

























