--package.path="/downloads/CCCentral"
local turtletools=require "TurtleTools"
local chunk=require "Chunk"

local str_fullinventory = "To work, the turtle needs free space in the inventory."
local str_needpickaxe = "To work, the turtle needs a new diamond pickaxe. Put the pickaxe in the inventory"

term.clear()
term.setCursorPos(1, 1)
print("Step 0: Preparing the turtle for work")
--inventory
if turtletools.findEmptySlot() == 0 then
	print(str_fullinventory)
end
while turtletools.findEmptySlot() == 0 do
	sleep(3)
end
--pickaxe
local h, b = turtletools.getToolNameRight(turtletools.str_pickaxe)
if b == false then
	h, b = turtletools.getToolNameLeft(turtletools.str_pickaxe)
	if b == false then
		print(str_needpickaxe)
	end
end
if b == false then
	turtletools.equipTool(turtletools.str_pickaxe)
end

print("Structures will be built in the middle of the chanks")
print("Step 1: Finding a location in the world")
print("Write the current coordinates of the turtle")
write("X:.. "); local x = read()
write("Y:.. "); local y = read()
write("Z:.. "); local z = read()


