function update(dt)
	if matchingtable == nil then
		matchingtablelist = world.objectQuery({object.position()[1]+5,object.position()[2]},1)
		for _,j in ipairs(matchingtablelist) do
			if world.entityName(j) == "barsectionalright" then matchingtable = j end
		end
	end
end

function die()
	if matchingtable ~= nil then world.breakObject(matchingtable) end
end
