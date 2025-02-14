require "/scripts/vec2.lua"

function init()
	self.energyCost = config.getParameter("energyCost")
	self.deactiveDelayMax = 0.3
	self.deactiveDelay = 0
	self.deactiveReady = false
end

function uninit()
	deactivate()
end

function update(args)
	if not self.specialLast and args.moves["special1"] then
		attemptActivation()
	end
	self.specialLast = args.moves["special"] == 1

	if args.moves["primaryFire"] or args.moves["altFire"] then
		self.deactiveReady = true
	end

	if self.deactiveReady then
		self.deactiveDelay = self.deactiveDelay - args.dt;
		if self.deactiveDelay <= 0 then
			deactivate()
			self.deactiveReady = false
		end
	end
	--unused, junk, does nothing.
	--[[if not self.active and world.getProperty("hide[" .. tostring(entity.id()) .. "]") then
		world.setProperty("hide[" .. tostring(entity.id()) .. "]", nil)
	end]]
end

function attemptActivation()
	if not self.active and status.overConsumeResource("energy", self.energyCost) then
		activate()
	elseif self.active then
		deactivate()
	end
end

function activate()
	self.active = true
	self.deactiveDelay = self.deactiveDelayMax
end

function deactivate()
	self.active = false
end

function generateSkillEffect()
	status.setPersistentEffects("movementAbility", {{stat = "activeMovementAbilities", amount = 1}})
end
