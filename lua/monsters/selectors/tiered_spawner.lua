local monsterInit = init
function init()
	monsterInit()
	local selection = nil
	if config.getParameter("biomePools") then
		local biome = world.type()
		for k,v in pairs(config.getParameter"biomePools") do
			if k == biome then
				local pool = v
				selection = pool[math.random(#pool)]
			end
		end
	end
	if not selection then
		local pools = config.getParameter("pools")
		local tier = math.floor(world.threatLevel())
		selection = pools[math.max(1, math.min(tier, #pools))]
		selection = selection[math.random(#selection)]
	end
	world.spawnMonster(selection or "gleap", mcontroller.position(),{aggressive = true, level = world.threatLevel()})
	status.setResource("health", 0)
end
