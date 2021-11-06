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
		obj.x = math.floor(x/16)
		obj.y = math.floor(y/16)
		obj.z = math.floor(z/16)
		obj.xmin = obj.x * 16
		obj.xmax = obj.xmin + 15
		obj.ymin = obj.y * 16
		obj.ymax = obj.ymin + 15
		obj.zmin = obj.z * 16
		obj.zmax = obj.zmin + 15
		
	--Location in the chank from 0 to 15
	function obj:getLocal(x, y, z)
		return x-obj.xmin, y-obj.ymin, z-obj.zmin
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

function Chunk.getLocal(x, y, z, chunk)
	if not chunk then
		return x-math.floor(x/16)*16, y-math.floor(y/16)*16, z-math.floor(z/16)*16
	end
	return x-chunk.xmin, y-chunk.ymin, z-chunk.zmin
end


return Chunk