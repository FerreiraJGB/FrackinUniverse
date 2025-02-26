function init()
	effect.addStatModifierGroup({{stat = "fallDamageMultiplier", effectiveMultiplier = 0.10}})
	--self.movementParams = mcontroller.baseParameters()
	self.liquidMovementParameter = {
		airJumpProfile = {
			jumpSpeed = 30
		}
	}
	script.setUpdateDelta(5)

end

function update(dt)
	mcontroller.controlParameters(self.liquidMovementParameter)
	if not mcontroller.onGround() then
		mcontroller.controlParameters(config.getParameter("fallingParameters"))
		mcontroller.setYVelocity(math.max(mcontroller.yVelocity(), config.getParameter("maxFallSpeed")))
	end
end

function uninit()

end


