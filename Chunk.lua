local Chunk = {}

--[[Get a new chunk object.
Requires raw coordinates x, y (height), z
Returns Chunk | nil (if the arguments are incorrect)
--]]
function Chunk:new(x, y, z)
	if type(x) ~= "number" or type(y) ~= "number" or type(z) ~= "number" then
		return nil
	end
	
	--[[properties
	 x, y, z - raw coordinates in the world
	 cx, cy, cz - chunk coordinates
	 xmin, .. , zmax - chunk border --]]
	local obj = {}
		obj.x = x
		obj.y = y
		obj.z = z
		obj.cx = math.floor(x/16)
		obj.cy = math.floor(y/16)
		obj.cz = math.floor(z/16)
		obj.xmin = obj.cx * 16
		obj.xmax = obj.xmin + 15
		obj.ymin = obj.cy * 16
		obj.ymax = obj.ymin + 15
		obj.zmin = obj.cz * 16
		obj.zmax = obj.zmin + 15
		obj.ve
		
	--Location in the chank from 0 to 15
	function obj:getLocal()
		return obj.x-obj.xmin, obj.y-obj.ymin, obj.z-obj.zmin
	end
	
	--[[get x, z Chunk center (offset to a minimum)
	function obj:getCentral()
		return obj.xmin+7, obj.zmin+7
	end--]]
	
	--return obj
	setmetatable(obj, self)
	self.__index = self
	return obj
end




return Chunk