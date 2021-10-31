term.clear()
term.setCursorPos(1, 1)
print("Initial adjustment is required, the turtle will find the center of the chunk \n")
print("WRITE THE INITIAL COORDINATES IN THE WORLD?")
x=write("X: ")
y=write("Y: ")
z=write("Z: ")

while turtle.forward()==false do
	turtle.dig()
	if turtle.getFuelLevel<20 then
		print("NEED TO REFUEL A LITTLE")
	end
	while turtle.getFuelLevel<20 do
		shell.run("refuel 1")
		sleep(3)
	end
end
print("WRITE NEW COORDINATES IN THE WORLD?")
x=write("X: ")
y=write("Y: ")
z=write("Z: ")
